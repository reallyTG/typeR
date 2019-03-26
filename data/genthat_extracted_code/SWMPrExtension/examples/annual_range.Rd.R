library(SWMPrExtension)


### Name: annual_range
### Title: Annual Range Timeseries
### Aliases: annual_range annual_range.swmpr

### ** Examples

## Don't show: 
data(apacpwq)

dat <- qaqc(apacpwq, qaqc_keep = c('0', '3', '5'))

y <- annual_range(dat, param = 'do_mgl', target_yr = 2012)
## End(Don't show)

## Not run: 
##D ## get data, prep
##D data(elksmwq)
##D dat <- elksmwq
##D 
##D dat <- qaqc(elksmwq, qaqc_keep = c('0', '3', '5'))
##D do_plt <- annual_range(dat, param = 'do_mgl', target_yr = 2012)
##D do_plt <- annual_range(dat, param = 'do_mgl', target_yr = 2012, criteria = 2)
## End(Not run)



