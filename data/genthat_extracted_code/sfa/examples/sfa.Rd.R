library(sfa)


### Name: sfa
### Title: Fitting stochastic frontier analysis models
### Aliases: sfa sfa.fit
### Keywords: models

### ** Examples

set.seed(225)
daten <- dgp(n = 100, b = c(1, 2), sc = -1)
test <- sfa(y ~ x, data = daten)



