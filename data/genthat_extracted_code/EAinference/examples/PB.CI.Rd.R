library(EAinference)


### Name: PB.CI
### Title: Provide '(1-alpha)%' confidence interval of each coefficients
### Aliases: PB.CI

### ** Examples

set.seed(1234)
n <- 40
p <- 50
Niter <-  10
X <- matrix(rnorm(n*p), n)
object <- PBsampler(X = X, PE_1 = c(1,1,rep(0,p-2)), sig2_1 = 1, lbd_1 = .5,
niter = 100, type = "lasso")
parallel <- (.Platform$OS.type != "windows")
PB.CI(object = object, alpha = .05, method = "none")




