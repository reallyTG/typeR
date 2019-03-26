library(kdecopula)


### Name: predict.kdecopula
### Title: Prediction method for 'kdecop()' fits
### Aliases: predict.kdecopula

### ** Examples

data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x) / (length(x) + 1))
fit <- kdecop(udat[, 5:6])

all.equal(predict(fit, c(0.1, 0.2)), dkdecop(c(0.1, 0.2), fit))
all.equal(predict(fit, udat, "hfunc1"), hkdecop(udat, fit, cond.var = 1))



