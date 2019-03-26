library(SWMPrExtension)


### Name: seasonal_boxplot
### Title: Seasonal boxplots
### Aliases: seasonal_boxplot seasonal_boxplot.swmpr

### ** Examples

## Don't show: 
data(apacpwq)

dat <- qaqc(apacpwq, qaqc_keep = c('0', '3', '5'))

y <- seasonal_boxplot(dat, param = 'do_mgl', target_yr = 2012)
## End(Don't show)

## Not run: 
##D dat <- elksmwq
##D 
##D dat <- qaqc(dat, qaqc_keep = c('0', '3', '5'))
##D 
##D do_plt <- seasonal_boxplot(dat, param = 'do_mgl')
##D 
##D do_plt <- seasonal_boxplot(dat, param = 'do_mgl',
##D target_yr = 2015,
##D season = list(c(1,2,3), c(4,5,6), c(7,8,9), c(10, 11, 12)),
##D season_names = c('Winter', 'Spring', 'Summer', 'Fall'),
##D season_start = 'Spring')
##D 
##D do_plt_min <- seasonal_boxplot(dat, param = 'do_mgl',
##D stat_lab = 'Minimum', FUN = function(x) min(x, na.rm = TRUE))
##D 
##D do_plt_max <- seasonal_boxplot(dat, param = 'do_mgl',
##D stat_lab = 'Maximum', FUN = function(x) max(x, na.rm = TRUE))
## End(Not run)



