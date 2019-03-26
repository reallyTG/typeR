library(spc)


### Name: mewma.psi
### Title: Compute steady-state density of the MEWMA statistic
### Aliases: mewma.psi
### Keywords: ts

### ** Examples

lambda <- 0.1
L0 <- 1000
p <- 3
h4 <- mewma.crit(lambda, L0, p)
x_ <- seq(0, h4*lambda/(2-lambda), by=0.002)
psi <- mewma.psi(lambda, h4, p)
psi_ <- psi(x_)
#plot(x_, psi_, type="l", xlab="x", ylab=expression(psi(x)))



