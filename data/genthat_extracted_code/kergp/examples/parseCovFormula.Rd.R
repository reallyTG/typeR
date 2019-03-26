library(kergp)


### Name: parseCovFormula
### Title: Parse a Formula or Expression Describing a Composite Covariance
###   Kernel
### Aliases: parseCovFormula

### ** Examples

## =========================================================================
## build some kernels (with their inputNames) in the global environment
## =========================================================================

myCovExp3 <- kMatern(d = 3, nu = "1/2")
inputNames(myCovExp3) <- c("x", "y", "z")

myCovGauss2 <- kGauss(d = 2)
inputNames(myCovGauss2) <- c("temp1", "temp2")

k <- kMatern(d = 1)
inputNames(k) <- "x"

ell <- kMatern(d = 1)
inputNames(ell) <- "y"

## =========================================================================
## Parse a formula. This formula is stupid because 'myCovGauss2'
## and 'myCovExp3' should be CORRELATION kernels and not
## covariance kernels to produce an identifiable model.
## =========================================================================

cov <- ~ tau2 * myCovGauss2() * myCovExp3() + sigma2 * k()
pf <- parseCovFormula(cov, trace = 1)

## =========================================================================
## Parse a formula with ANOVA composition
## =========================================================================

cov1 <- ~ tau2 * myCovGauss2() * myCovExp3() + sigma2 * (1 + k()) * (1 + ell())
pf1 <- parseCovFormula(cov1, trace = 1) 




