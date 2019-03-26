library(evd)


### Name: fgev
### Title: Maximum-likelihood Fitting of the Generalized Extreme Value
###   Distribution
### Aliases: fgev fitted.evd std.errors std.errors.evd vcov.evd print.evd
###   logLik.evd
### Keywords: models

### ** Examples

uvdata <- rgev(100, loc = 0.13, scale = 1.1, shape = 0.2)
trend <- (-49:50)/100
M1 <- fgev(uvdata, nsloc = trend, control = list(trace = 1))
M2 <- fgev(uvdata)
M3 <- fgev(uvdata, shape = 0)
M4 <- fgev(uvdata, scale = 1, shape = 0)
anova(M1, M2, M3, M4)
par(mfrow = c(2,2))
plot(M2)
## Not run: M2P <- profile(M2)
## Not run: plot(M2P)

rnd <- runif(100, min = -.5, max = .5)
fgev(uvdata, nsloc = data.frame(trend = trend, random = rnd))
fgev(uvdata, nsloc = data.frame(trend = trend, random = rnd), locrandom = 0)

uvdata <- rgev(100, loc = 0.13, scale = 1.1, shape = 0.2)
M1 <- fgev(uvdata, prob = 0.1)
M2 <- fgev(uvdata, prob = 0.01)
## Not run: M1P <- profile(M1, which = "quantile")
## Not run: M2P <- profile(M2, which = "quantile")
## Not run: plot(M1P)
## Not run: plot(M2P)



