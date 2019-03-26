library(demography)


### Name: models
### Title: Show model information for the forecast coefficients in FDM
###   models.
### Aliases: models models.fmforecast models.fmforecast2
### Keywords: models

### ** Examples

## Not run: 
##D fr.short <- extract.years(fr.sm,1950:2006)
##D fr.fit <- fdm(fr.short,series="male")
##D fr.fcast <- forecast(fr.fit)
##D models(fr.fcast)
##D 
##D fr.fit <- coherentfdm(fr.short)
##D fr.fcast <- forecast(fr.fit)
##D models(fr.fcast,select=1:3)
## End(Not run)


