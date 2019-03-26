library(demography)


### Name: update.fmforecast
### Title: Updating functional demographic models and coherent functional
###   demographic models.
### Aliases: update.fmforecast update.fmforecast2
### Keywords: models

### ** Examples

## Not run: 
##D france.fit <- fdm(fr.mort,order=2)
##D france.fcast <- forecast(france.fit,50)
##D # Replace first coefficient model with ARIMA(0,1,2)+drift
##D france.fcast$coeff[[2]] <- forecast(Arima(france.fit$coeff[,2], 
##D   order=c(0,1,2), include.drift=TRUE), h=50, level=80)
##D france.fcast <- update(france.fcast)
##D 
##D fr.short <- extract.years(fr.sm,1950:2006)
##D fr.fit <- coherentfdm(fr.short)
##D fr.fcast <- forecast(fr.fit)
##D par(mfrow=c(1,2))
##D plot(fr.fcast$male)
##D # Replace first coefficient model in product component with a damped ETS model:
##D fr.fcast$product$coeff[[2]] <- forecast(ets(fr.fit$product$coeff[,2], damped=TRUE), 
##D   h=50, level=80)
##D fr.fcast <- update(fr.fcast)
##D plot(fr.fcast$male)
## End(Not run)



