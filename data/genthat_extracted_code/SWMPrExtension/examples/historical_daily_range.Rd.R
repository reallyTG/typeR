library(SWMPrExtension)


### Name: historical_daily_range
### Title: Historical Daily Range Timeseries
### Aliases: historical_daily_range historical_daily_range.swmpr

### ** Examples

## Don't show: 
data(apacpwq)

dat <- qaqc(apacpwq, qaqc_keep = c('0', '3', '5'))

y <- historical_daily_range(dat, param = 'do_mgl', target_yr = 2012)
## End(Don't show)

## Not run: 
##D data(apacpwq)
##D dat <- apacpwq
##D 
##D dat <- qaqc(apacpwq, qaqc_keep = c('0', '3', '5'))
##D # with criteria
##D y <- historical_daily_range(dat, param = 'do_mgl', target_yr = 2013, criteria = 2)
##D 
##D # w/o criteria
##D x <- historical_daily_range(dat, param = 'do_mgl', target_yr = 2013)
##D 
##D # add a y label
##D x <- x + labs(x = NULL, y = "Dissolved Oxygen (mg/L)")
## End(Not run)



