            #=================================================================
            # Copyright 2026 Georgia Tech.  All rights reserved.
            # The materials provided by the instructor in this course are for
            # the use of the students currently enrolled in the course.
            # Copyrighted course materials may not be further disseminated.
            # This file must not be made publicly available anywhere.
            # =================================================================
            
            # HW2-2
            # Student Name:
            # Date:
            #
            #     Find George Variably Scaled
            #
            # This routine finds an exact match of George's face which may be
            # scaled in a crowd of faces.
            #
            #===========================================================================
            # CHANGE LOG: brief description of changes made from P1-2-shell.asm
            # to this version of code.
            # Date  Modification
            # 09/24 Looping through pixels to find one w/ color ...              (example)
            # 09/28 Reduced avg DI by only looking at pixels starting at row ... (example)
            #===========================================================================
            
.data
Crowd: .alloc 1024
            
.text
            
FindGeorge: addi a0, gp, Crowd # point to array base
            addi a7, zero, 592
            ecall # generate crowd
            
            # your code goes here
            
            # *****************************************************
            # The following instructions only demo the swi's.
            # They should be replaced with your code.
            addi a1, zero, 160 # mark the 160th pixel
            addi a7, zero, 552
            ecall # with this ecall
            addi a1, zero, 161 # mark the 161th pixel
            ecall # with this ecall
            
            addi a1, zero, 300 # guess the 300th pixel for top left corner
            slli a1, a1, 16
            ori a1, a1, 1015 # and the 1015th pixel for bottom right
            #
            # *****************************************************
            
            addi a7, zero, 593
            ecall # submit answer and check
            # *****************************************************
            # This unpacks the answer given in a2 by the oracle into:
            # t1: top left pixel location
            # t2: bottom right pixel location
            # TEMPORARY (can omit):
            srli t1, a2, 16 # top left pixel location
            lui t2, 0x1
            addi t2, t2, -1
            and t2, a2, t2 # bottom right pixel location
            # *****************************************************
            
            jalr ra, ra, 0 # return to caller
            