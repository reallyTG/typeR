library(cointReg)


### Name: getLeadLag
### Title: Leads and Lags
### Aliases: getLeadLag

### ** Examples

set.seed(1909)
y <- matrix(cumsum(rnorm(100)), ncol = 1)
x <- matrix(rep(y, 4) + rnorm(400, mean = 3, sd = 2), ncol = 4)
deter <- cbind(1, 1:100)
cointReg:::getLeadLag(x = x, y = y, deter = deter, max.lag = 5,
                      max.lead = 5, ic = "AIC", symmet = FALSE)



