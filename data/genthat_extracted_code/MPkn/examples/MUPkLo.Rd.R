library(MPkn)


### Name: MUPkLo
### Title: Calculations of one discrete model in several time steps
### Aliases: MUPkLo
### Keywords: MUPkLo

### ** Examples

A = array(c(-2, -3, 1, 4, -2, 1, 3, -1, -2), c(3, 3))
P <- array(c(0.9, 0.6, 0.8, 0.05, 0.2, 0.05, 0.05, 0.2, 0.15), c(3, 3))
U <- array(c(0.8, 0.8, 0.7, 0.06, 0.02, 0.2, 0.14, 0.18, 0.1), c(3, 3))
sta <- 3
Ao <- A
k <- c(1, 0, 1, 0)
n <- c(5, 7, 12, 17)
# Steps, in which will compute the value of the Mx:
# 1, 2, 3, 4, 5, 10, 20, 21,  22, 23, 24, 25, 50, 100, 200, 400, 800
Mx <- MUPkLo(A, P, U, n, k, sta)
print(Mx)
A <- Ao
Mb <- MUPkLo(A, P, U, n = 100, k = 1, sta)
Mb[100,,]



