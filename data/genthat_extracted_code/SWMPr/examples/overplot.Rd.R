library(SWMPr)


### Name: overplot
### Title: Plot multiple SWMP time series on the same y-axis
### Aliases: overplot overplot.swmpr overplot.default

### ** Examples

## import data
data(apacpwq)
dat <- qaqc(apacpwq)

## plot
overplot(dat)

## a truly heinous plot
overplot(dat, select = c('depth', 'do_mgl', 'ph', 'turb'), 
 subset = c('2013-01-01 0:0', '2013-02-01 0:0'), lwd = 2)
 
## Not run: 
##D ## change the type argument if plotting discrete and continuous data
##D swmp1 <- apacpnut
##D swmp2 <- apaebmet
##D dat <- comb(swmp1, swmp2, timestep = 120, method = 'union')
##D overplot(dat, select = c('chla_n', 'atemp'), subset = c('2012-01-01 0:0', '2013-01-01 0:0'), 
##D  type = c('p', 'l'))
## End(Not run)



