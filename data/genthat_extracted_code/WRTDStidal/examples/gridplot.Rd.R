library(WRTDStidal)


### Name: gridplot
### Title: Plot variable response to salinity/flow as a gridded surface for
###   all months
### Aliases: gridplot gridplot.tidal gridplot.tidalmean

### ** Examples

## Not run: 
##D ## load a fitted tidal object
##D data(tidfit)
##D 
##D ## defaults to the fiftieth quantile
##D gridplot(tidfit)
##D 
##D ## no facets, all months
##D gridplot(tidfit, month = 'all')
##D 
##D ## change the defaults
##D gridplot(tidfit, tau = c(0.1), month = c(3, 6, 9, 12), 
##D  col_vec = c('red', 'blue', 'green'), flo_fac = 1)
##D  
##D ## plot a tidalmean object
##D data(tidfitmean)
##D 
##D gridplot(tidfitmean)
##D 
## End(Not run)



