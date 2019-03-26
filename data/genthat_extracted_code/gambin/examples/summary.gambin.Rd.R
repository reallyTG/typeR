library(gambin)


### Name: summary.gambin
### Title: Summarising the results of a gambin model fit
### Aliases: summary.gambin

### ** Examples

data(moths)
fit = fit_abundances(moths)
summary(fit)
# multimodal gambin models with confidence intervals
biMod <- fit_abundances(moths, no_of_components = 2)
summary(biMod, confint = TRUE, n = 5) #large n takes a long time to run



