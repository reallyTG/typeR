library(isotone)


### Name: sSolver
### Title: Negative Poisson Log-Likelihood
### Aliases: sSolver
### Keywords: models

### ** Examples


##Minimizing Poisson log-liklihood
set.seed(12345)
yp <- rpois(9,5)
Atot <- cbind(1:8, 2:9)     ##Matrix defining isotonicity (total order)
x0 <- 1:9                   ##starting values
fit.poi <- activeSet(Atot, sSolver, x0 = x0, y = yp)



