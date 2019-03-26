library(multiwave)


### Name: fivarma
### Title: simulation of FIVARMA process
### Aliases: fivarma
### Keywords: ts datagen

### ** Examples


rho1 <- 0.3
rho2 <- 0.8
cov <- matrix(c(1,rho1,rho2,rho1,1,rho1,rho2,rho1,1),3,3)
d <- c(0.2,0.3,0.4)

J <- 9
N <- 2^J
VMA <- diag(c(0.4,0.1,0))
### or another example VAR <- array(c(0.8,0,0,0,0.6,0,0,0,0.2,0,0,0,0,0.4,0,0,0,0.5),dim=c(3,3,2))
VAR <- diag(c(0.8,0.6,0))
resp <- fivarma(N, d, cov_matrix=cov, VAR=VAR, VMA=VMA)
x <- resp$x
long_run_cov <- resp$long_run_cov
d <- resp$d






