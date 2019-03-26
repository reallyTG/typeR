library(kergp)


### Name: k1Exp
### Title: Predefined covMan Objects for 1D Kernels
### Aliases: k1Exp k1PowExp k1Gauss k1Matern3_2 k1Matern5_2
### Keywords: datasets

### ** Examples

set.seed(1234)
x <- sort(runif(40))
X <- cbind(x = x)
yExp <- simulate(k1Exp, nsim = 20, X = X)
matplot(X, yExp, type = "l", col = "SpringGreen", ylab = "")
yGauss <- simulate(k1Gauss, nsim = 20, X = X)
matlines(X, yGauss, col = "orangered")
title("Simulated paths from 'k1Exp' (green) and 'k1Gauss' (orange)")

## ============================================================================
## You can build a similar object using a creator of
## 'covMan'. Although the objects 'k1Gauss' and 'myk1Gauss' differ,
## they describe the same mathematical object.
## ============================================================================

myk1Gauss <- kGauss(d = 1)





