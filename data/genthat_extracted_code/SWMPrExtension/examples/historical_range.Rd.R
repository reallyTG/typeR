library(SWMPrExtension)


### Name: historical_range
### Title: Historical Monthly/Seasonal Range Timeseries
### Aliases: historical_range historical_range.swmpr

### ** Examples

## Don't show: 
data(apacpwq)

dat <- qaqc(apacpwq, qaqc_keep = c('0', '3', '5'))

y <- historical_range(dat, param = 'do_mgl')
## End(Don't show)

## Not run: 
##D data(elksmwq)
##D 
##D dat <- qaqc(elksmwq, qaqc_keep = c('0', '3', '5'))
##D # with criteria
##D y <- historical_range(dat, param = 'do_mgl', target_yr = 2013, criteria = 2)
##D 
##D # w/o criteria
##D x <- historical_range(dat, param = 'do_mgl', target_yr = 2013)
##D 
##D # add a y label
##D x <- x + labs(x = NULL, y = "Dissolved Oxygen (mg/L)")
## End(Not run)



