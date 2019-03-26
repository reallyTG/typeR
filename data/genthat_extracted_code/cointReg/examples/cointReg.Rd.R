library(cointReg)


### Name: cointReg
### Title: Estimation and Inference for cointegrating regressions
### Aliases: cointReg

### ** Examples

set.seed(1909)
x1 = cumsum(rnorm(100, mean = 0.05, sd = 0.1))
x2 = cumsum(rnorm(100, sd = 0.1)) + 1
x3 = cumsum(rnorm(100, sd = 0.2)) + 2
x = cbind(x1, x2, x3)
y = x1 + x2 + x3 + rnorm(100, sd = 0.2) + 1
deter = cbind(level = 1, trend = 1:100)
cointReg("FM", x = x, y = y, deter = deter, kernel = "ba",
         bandwidth = "and")

# Compare the results of all three models:
res = sapply(c("FM", "D", "IM"), cointReg, x = x, y = y, deter = deter)
do.call(cbind, lapply(res, "[[", "theta"))




