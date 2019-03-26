library(MPkn)


### Name: MUPkL
### Title: Calculations of one discrete model in several time steps
### Aliases: MUPkL
### Keywords: MUPkL

### ** Examples

A <- array(c(2, 3, 1, 4, 2, 1, 3, 1, 2), c(3, 3))
P <- array(c(0.9, 0.6, 0.8, 0.05, 0.2, 0.05, 0.05, 0.2, 0.15),
					 c(3, 3))
U <- array(c(0.8, 0.8, 0.7, 0.06, 0.02, 0.2, 0.14, 0.18, 0.1),
					 c(3, 3))
sta <- c(1, 3)
k <- 3
n <- 8
M33 <- MUPkL(A, P, U, n, k, sta)
print(M33$N)
k <- 1
n <- 24
M11 <- MUPkL(A, P, U, n, k, sta)
print(M11$N)
k <- 0
n <- 6
M00 <- MUPkL(A, P, U, n, k, sta)
print(M00$N)



