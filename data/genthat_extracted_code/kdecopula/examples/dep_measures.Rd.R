library(kdecopula)


### Name: dep_measures
### Title: Dependence measures of a 'kdecop()' fit
### Aliases: dep_measures

### ** Examples

## load data and transform with empirical cdf
data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x) / (length(x) + 1))

## estimate copula density and calculate dependence measures
fit <- kdecop(udat[, 5:6])
dep_measures(fit)




