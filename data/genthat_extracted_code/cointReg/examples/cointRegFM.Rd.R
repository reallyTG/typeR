library(cointReg)


### Name: cointRegFM
### Title: Fully Modified OLS
### Aliases: cointRegFM

### ** Examples

set.seed(1909)
x1 = cumsum(rnorm(100, mean = 0.05, sd = 0.1))
x2 = cumsum(rnorm(100, sd = 0.1)) + 1
x3 = cumsum(rnorm(100, sd = 0.2)) + 2
x = cbind(x1, x2, x3)
y = x1 + x2 + x3 + rnorm(100, sd = 0.2) + 1
deter = cbind(level = 1, trend = 1:100)
test = cointRegFM(x, y, deter, kernel = "ba", bandwidth = "and")
print(test)




