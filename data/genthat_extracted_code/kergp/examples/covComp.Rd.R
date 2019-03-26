library(kergp)


### Name: covComp
### Title: Creator for the Class '"covComp"' for Composite Covariance
###   Kernels.
### Aliases: covComp

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

tau2 <- 100
sigma2 <- 4

myCovComp <- covComp(formula = ~ tau2 * myCovGauss2() * myCovExp3() + sigma2 * k())

myCovComp1 <- covComp(formula = ~ myCovGauss2() * myCovExp3() + k())

inputNames(myCovComp)
coef(myCovComp)

n <- 5
set.seed(1234)
X <- data.frame(x = runif(n), y = runif(n), z = runif(n),
                temp1 = runif(n), temp2 = runif(n))

C <- covMat(myCovComp, X = X)

Cg <- covMat(myCovComp, X = X, compGrad = TRUE)

## Simulation: purely formal example, not meaningful.

Y <- simulate(myCovComp, X = X, nsim = 100)




