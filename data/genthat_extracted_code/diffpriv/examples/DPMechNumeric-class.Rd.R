library(diffpriv)


### Name: DPMechNumeric-class
### Title: A virtual S4 class for differentially-private numeric
###   mechanisms.
### Aliases: DPMechNumeric-class DPMechNumeric show,DPMechNumeric-method
###   sensitivityNorm,DPMechNumeric-method
###   releaseResponse,DPMechNumeric,DPParamsEps-method

### ** Examples

f <- function(xs) mean(xs)
n <- 100
m <- DPMechLaplace(sensitivity = 1/n, target = f, dims = 1)
X1 <- runif(n)
X2 <- runif(n)
sensitivityNorm(m, X1, X2)
f <- function(xs) mean(xs)
n <- 100
m <- DPMechLaplace(sensitivity = 1/n, target = f, dims = 1)
X <- runif(n)
p <- DPParamsEps(epsilon = 1)
releaseResponse(m, p, X)



