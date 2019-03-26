library(dplR)


### Name: xskel.plot
### Title: Skeleton Plot for Series and Master
### Aliases: xskel.plot
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
xskel.plot(rwl=dat,series=bad.series,win.start=1850)
# overlap missing ring
xskel.plot(rwl=dat,series=bad.series,win.start=1800)



