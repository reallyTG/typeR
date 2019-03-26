library(srp)


### Name: sic.c
### Title: The smoothness change-point detection of regression coefficients
###   in linear model
### Aliases: sic.c

### ** Examples

library(fda)
x <- matrix(rnorm(10000), ncol=100)
y <- matrix(rnorm(100), ncol=1)
p <- dim(x)[1] + 1
t <- seq(0, 1, length.out=dim(x)[1])*(dim(x)[1])
x.basis <- as.fd(splinefun(t, x[, 1], method="natural"))$basis
B.basis <- create.bspline.basis(rangeval=c(0, dim(x)[1]), norder=4, nbasis=35)
result <- sic.c(x.basis=x.basis, B.basis=B.basis, x=x, y=y, cf0=ncs(x)$cf0, maxq=10, L=35)
plot(result$sicq, type="b")



