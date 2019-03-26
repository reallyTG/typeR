library(kdecopula)


### Name: logLik.kdecopula
### Title: Log-Likelihood of a 'kdecopula' object
### Aliases: logLik.kdecopula

### ** Examples

## load data and transform with empirical cdf
data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x) / (length(x) + 1))

## estimation of copula density of variables 5 and 6
fit <- kdecop(udat[, 5:6])

## compute fit statistics
logLik(fit)
AIC(fit)
BIC(fit)




