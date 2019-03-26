library(WRTDStidal)


### Name: nobsplot
### Title: Plot number of observations in a WRTDS interpolation grid
### Aliases: nobsplot nobsplot.default nobsplot.tidal nobsplot.tidalmean

### ** Examples

## Not run: 
##D ## load a fitted tidal object
##D data(tidfit)
##D 
##D ## default plot
##D nobsplot(tidfit)
##D 
##D ## no facets, all months
##D nobsplot(tidfit)
##D 
##D ## change the defaults
##D nobsplot(tidfit, tau = c(0.1), month = c(3, 6, 9, 12), 
##D  col_vec = c('red', 'blue', 'green'), flo_fac = 1)
##D  
##D ## plot a tidalmean object
##D data(tidfitmean)
##D 
##D nobsplot(tidfitmean)
##D 
## End(Not run)



