library(hypergeo)


### Name: wolfram
### Title: Various functions taken from the Wolfram Functions Site
### Aliases: wolfram w07.23.06.0026.01 w07.23.06.0026.01_bit1
###   w07.23.06.0026.01_bit2 w07.23.06.0026.01_bit3_a
###   w07.23.06.0026.01_bit3_b w07.23.06.0026.01_bit3_c w07.23.06.0029.01
###   w07.23.06.0031.01 w07.23.06.0031.01_bit1 w07.23.06.0031.01_bit2
### Keywords: math

### ** Examples


# Here we catch some answers from Maple (jjM) and compare it with R's:


jjM <- 0.95437201847068289095 + 0.80868687461954479439i # Maple's answer
jjR <- w07.23.06.0026.01(A=1.1 , n=1 , m=4 , z=1+1i) 
# [In practice, one would type 'hypergeo(1.1, 2.1, 5.1, 1+1i)']

stopifnot(Mod(jjM - jjR) < 1e-10)


jjM <- -0.25955090546083991160e-3 - 0.59642767921444716242e-3i
jjR <- w07.23.06.0029.01(A=4.1 , n=1 , m=1 , z=1+4i)
# [In practice, one would type 'hypergeo(4.1, 3.1, 5.1, 1+1i)']

stopifnot(Mod(jjM - jjR) < 1e-15)

jjM <- 0.33186808222278923715e-1 - 0.40188208572232037363e-1i
jjR <- w07.23.06.0031.01(6.7,2,1,2+1i)
# [In practice, one would type 'hypergeo(6.7, 8.7, 7.7, 2+1i)']
stopifnot(Mod(jjM - jjR) < 1e-10)



