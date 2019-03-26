library(cointReg)


### Name: getModD
### Title: Get D OLS model.
### Aliases: getModD

### ** Examples

set.seed(1909)
y <- matrix(cumsum(rnorm(100)), ncol = 1)
x <- matrix(rep(y, 4) + rnorm(400, mean = 3, sd = 2), ncol = 4)
deter <- cbind(1, 1:100)
cointReg:::getModD(x = x, y = y, deter = deter, n.lag = 2, n.lead = 3)



