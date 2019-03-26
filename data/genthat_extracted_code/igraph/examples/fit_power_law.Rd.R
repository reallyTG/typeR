library(igraph)


### Name: fit_power_law
### Title: Fitting a power-law distribution function to discrete data
### Aliases: fit_power_law power.law.fit
### Keywords: graphs

### ** Examples


# This should approximately yield the correct exponent 3
g <- barabasi.game(1000) # increase this number to have a better estimate
d <- degree(g, mode="in")
fit1 <- fit_power_law(d+1, 10)
fit2 <- fit_power_law(d+1, 10, implementation="R.mle")

fit1$alpha
stats4::coef(fit2)
fit1$logLik
stats4::logLik(fit2)




