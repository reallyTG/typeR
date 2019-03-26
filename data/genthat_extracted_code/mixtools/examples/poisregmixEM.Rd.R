library(mixtools)


### Name: poisregmixEM
### Title: EM Algorithm for Mixtures of Poisson Regressions
### Aliases: poisregmixEM
### Keywords: file

### ** Examples

## EM output for data generated from a 2-component model.

set.seed(100)
beta <- matrix(c(1, .5, .7, -.8), 2, 2)
x <- runif(50, 0, 10)
xbeta <- cbind(1, x)%*%beta
w <- rbinom(50, 1, .5)
y <- w*rpois(50, exp(xbeta[, 1]))+(1-w)*rpois(50, exp(xbeta[, 2]))
out <- poisregmixEM(y, x, verb = TRUE,  epsilon = 1e-03)
out



