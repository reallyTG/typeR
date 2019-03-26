library(cointReg)


### Name: print.cointReg
### Title: Print Method for Cointegration Models (Modified OLS).
### Aliases: print.cointReg

### ** Examples

set.seed(42)
x = data.frame(x1 = cumsum(rnorm(200)), x2 = cumsum(rnorm(200)))
eps1 = rnorm(200, sd = 2)
y = x$x1 - x$x2 + 10 + eps1
deter = cbind(level = rep(1, 200))

test.fm = cointRegFM(x = x, y = y, deter = deter)
print(test.fm)

test.d = cointRegD(x = x, y = y, deter = deter)
print(test.d)

test.im2 = cointRegIM(x = x, y = y, deter = deter)
print(test.im2)




