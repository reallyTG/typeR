library(demography)


### Name: simulate.fmforecast
### Title: Simulate future sample paths from functional demographic model
###   forecasts.
### Aliases: simulate.fmforecast simulate.fmforecast2
### Keywords: models

### ** Examples

## Not run: 
##D france.fit <- fdm(fr.mort,order=2)
##D france.fcast <- forecast(france.fit,50,method="ets")
##D france.sim <- simulate(france.fcast,nsim=100)
##D 
##D france.fit2 <- coherentfdm(fr.sm)
##D france.fcast2 <- forecast(france.fit2,50)
##D france.sim2 <- simulate(france.fcast2,nsim=100)
## End(Not run)



