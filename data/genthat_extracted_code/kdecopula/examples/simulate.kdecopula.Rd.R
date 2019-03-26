library(kdecopula)


### Name: simulate.kdecopula
### Title: Simulate data from a 'kdecop()' fit.
### Aliases: simulate.kdecopula

### ** Examples

data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x) / (length(x) + 1))
fit <- kdecop(udat[, 5:6])
plot(simulate(fit, 500))




