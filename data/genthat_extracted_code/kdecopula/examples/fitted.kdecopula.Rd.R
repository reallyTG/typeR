library(kdecopula)


### Name: fitted.kdecopula
### Title: Extract fitted values from a 'kdecop()' fits.
### Aliases: fitted.kdecopula

### ** Examples

data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x) / (length(x) + 1))
fit <- kdecop(udat[, 5:6])

all.equal(fitted(fit), predict(fit, fit$udata))



