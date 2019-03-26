library(WRTDStidal)


### Name: dynaplot
### Title: Plot model response to salinity or flow as a lineplot for all
###   months
### Aliases: dynaplot dynaplot.tidal dynaplot.tidalmean

### ** Examples


# load a fitted tidal object
data(tidfit)

# plot using defaults, 
# defaults to the fiftieth quantile for all years
dynaplot(tidfit)
## Not run: 
##D # change the defaults
##D dynaplot(tidfit, tau = 0.9, month = 2, years = seq(1980, 1990), 
##D  col_vec = rainbow(7), alpha = 0.5, size = 3) 
##D  
##D # plot a tidalmean object
##D data(tidfitmean)
##D 
##D dynaplot(tidfitmean)
## End(Not run)



