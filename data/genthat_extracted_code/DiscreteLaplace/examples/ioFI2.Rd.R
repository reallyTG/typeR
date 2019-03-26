library(DiscreteLaplace)


### Name: ioFI2
### Title: Inverse of the observed Fisher Information matrix
### Aliases: ioFI2
### Keywords: htest distribution

### ** Examples

n <- 100
p <- 0.4
q <- 0.7
x <- rdlaplace2(n, p, q)
M <- ioFI2(x)
par <- estdlaplace2(x, "ML")
se <- diag(sqrt(M))
par # MLEs
se # standard errors
M # compare with  the inverse of Fisher Information matrix
iFI2(par[1], par[2])/n # with MLEs plugged in
iFI2(p, q)/n # or the true values



