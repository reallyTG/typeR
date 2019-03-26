library(vegperiod)


### Name: read.DWDdata
### Title: Fetch meteo data of DWD weather stations
### Aliases: read.DWDdata

### ** Examples

## Not run: 
##D # fetch last 500 days worth of data from station Göttingen
##D clim <- read.DWDdata(id=1691)
##D 
##D # save data & metadata (documentation about devices, downtimes etc.)
##D clim <- read.DWDdata(id=1691, destdir='.')
##D 
##D # find and download historical data from the Brocken
##D stat.hist <- read.DWDstations(period='historical')
##D brocken.id <- stat.hist[grep("^Brock", stat.hist$name), ]$id
##D clim.brocken <- read.DWDdata(id=brocken.id, period='historical')
## End(Not run)




