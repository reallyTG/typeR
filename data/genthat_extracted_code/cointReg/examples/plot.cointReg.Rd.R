library(cointReg)


### Name: plot.cointReg
### Title: Plot Method for Cointegration Models (Modified OLS).
### Aliases: plot.cointReg

### ** Examples

set.seed(42)
x = data.frame(x1 = cumsum(rnorm(200)), x2 = cumsum(rnorm(200)))
eps1 = rnorm(200, sd = 2)
y = x$x1 - x$x2 + 10 + eps1
deter = cbind(level = rep(1, 200))
test = cointRegFM(x = x, y = y, deter = deter)
plot(test)




