library(meteoForecast)


### Name: Forecast variables
### Title: Forecast Variables available in each model.
### Aliases: grepVar
### Keywords: datasets

### ** Examples


## Not run: 
##D ## Variables available recently
##D grepVar('cloud', service = 'gfs', complete = TRUE)
##D 
##D ## Variables available some time ago
##D grepVar('cloud', service = 'gfs',
##D         day = Sys.Date() - 500,
##D         complete = TRUE)
##D 
##D ## You can get the complete list with x = ""
##D grepVar("", service = 'meteogalicia', complete = TRUE)
## End(Not run)



