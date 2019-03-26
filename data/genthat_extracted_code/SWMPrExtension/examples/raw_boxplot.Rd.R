library(SWMPrExtension)


### Name: raw_boxplot
### Title: Boxplots of raw data by user-defined season for a target year
### Aliases: raw_boxplot raw_boxplot.swmpr

### ** Examples

## Don't show: 
data(apacpwq)

dat <- qaqc(apacpwq, qaqc_keep = c('0', '3', '5'))

y <- raw_boxplot(dat, param = 'do_mgl')
## End(Don't show)

## Not run: 
##D ## get data, prep
##D data(elksmwq)
##D dat <- elksmwq
##D 
##D dat <- qaqc(elksmwq, qaqc_keep = c('0', '3', '5'))
##D raw_boxplot(dat, param = 'do_mgl')
##D 
## End(Not run)




