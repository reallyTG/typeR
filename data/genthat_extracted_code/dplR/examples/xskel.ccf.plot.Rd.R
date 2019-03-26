library(dplR)


### Name: xskel.ccf.plot
### Title: Skeleton Plot for Series and Master with Cross Correlation
### Aliases: xskel.ccf.plot
### Keywords: hplot

### ** Examples
library(utils)
data(co021)
dat <- co021
#corrupt a series
bad.series <- dat$"641143"
names(bad.series) <- rownames(dat)
bad.series <- delete.ring(bad.series,year=1825)
# good match
xskel.ccf.plot(rwl=dat,series=bad.series,win.start=1900,win.width=50)
# overlap missing ring
xskel.ccf.plot(rwl=dat,series=bad.series,win.start=1800,win.width=50)



