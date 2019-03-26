library(vegperiod)


### Name: read.DWDstations
### Title: Fetch list of DWD weather stations
### Aliases: read.DWDstations

### ** Examples

## Not run: 
##D # stations with daily climate data
##D stations <- read.DWDstations()
##D 
##D # precipitation stations with monthly historical data
##D precip <- read.DWDstations(type='precip', period='historical',
##D                            resolution='monthly')
##D 
##D # list stations with daily data updated within last week
##D stat.daily <- read.DWDstations(period='recent')
##D stat.daily.recent <- stat.daily[stat.daily$to > (Sys.Date() - 7), ]
## End(Not run)




