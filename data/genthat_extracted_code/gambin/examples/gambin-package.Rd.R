library(gambin)


### Name: gambin-package
### Title: Fit the gambin model to species abundance distributions
### Aliases: gambin-package gambin
### Keywords: package

### ** Examples

data(moths, package = "gambin")
fit = fit_abundances(moths)
barplot(fit)
lines(fit)
AIC(fit)



