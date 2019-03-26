library(surveillance)


### Name: addSeason2formula
### Title: Function that adds a sine-/cosine formula to an existing
###   formula.
### Aliases: addSeason2formula

### ** Examples

# add 2 sine/cosine terms to a model with intercept and linear trend
addSeason2formula(f = ~ 1 + t, S = 2)

# the same for monthly data
addSeason2formula(f = ~ 1 + t, S = 2, period = 12)

# different number of seasons for a bivariate time series
addSeason2formula(f = ~ 1, S = c(3, 1), period = 52)



