;Ecuacion ((a*b)+2)/2
SYS_SALIDA equ 1
SYS_LEE equ 3
SYS_PRINT equ 4
STDIN equ 0
STDOUT equ 1

segment .data

	msg6 db  0xA,0xD,"el resultado es: "
	len6 equ $- msg6

segment .bss
	resultadoa resb 1
	resultadob resb 1
	resultadoc resb 1
	resultadofinal resb 1


section  .text
	global _start  ;must be declared for using gcc
_start:  ;tell linker entry point

	;//EMPIEZA 4X//
	mov eax, 4
	mov ecx, 2
	mul ecx
	mov [resultadoa], eax


	;Empieza (3x^2)/2
	mov eax, 2
	mov ebx, 2
	mov ecx, 3
	mul ebx
	mul ecx
	div ebx
	mov [resultadob], eax


	;Empieza (3x^3)/3
	mov eax, 2
	mov ebx, 3
	mov ecx, 2
	mul ecx
	mul ecx
	mul ebx
	div ebx
	mov [resultadoc], eax


	;Resultado Final
	mov eax, [resultadoa]
	mov ebx, [resultadob]
	mov ecx, [resultadoc]
	add eax, ebx
	sub eax, ecx
	add eax, '0'
	mov [resultadofinal], eax


	;Impresion Letrero
	mov eax, SYS_PRINT
	mov ebx, STDOUT
	mov ecx, msg6
	mov edx, len6
	int 0x80

	;Impresion Resultado
	mov eax, SYS_PRINT
	mov ebx, STDOUT
	mov ecx, resultadofinal
	mov edx, 1
	int 0x80


salir:
	mov eax, SYS_SALIDA
	xor ebx, ebx
	int 0x80
