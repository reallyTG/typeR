library(srp)


### Name: sic.l
### Title: The smoothness change-point detection of regression coefficients
###   in (simpler) Smooth-Rough Partition linear regression model
### Aliases: sic.l

### ** Examples

library(fda)
x <- matrix(rnorm(10000), ncol=100)
y <- matrix(rnorm(100), ncol=1)
p <- dim(x)[1] + 1
t <- seq(0, 1, length.out=dim(x)[1])*(dim(x)[1])
x.basis <- as.fd(splinefun(t, x[, 1], method="natural"))$basis
M.basis <- create.monomial.basis(rangeval=c(0, dim(x)[1]), nbasis=2)
result <- sic.l(x.basis=x.basis, M.basis=M.basis, x=x, y=y, cf0=ncs(x)$cf0, maxq=10)
plot(result$sicq, type="b")



