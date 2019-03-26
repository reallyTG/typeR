library(astrochron)


### Name: mwStats
### Title: 'Dynamic window' moving average, median and variance of
###   stratigraphic series
### Aliases: mwStats

### ** Examples

# generate example series from ar1 noise, 5 kyr sampling interval
ex = ar1(npts=1001,dt=5)

# jitter sampling times
ex[1]=ex[1]+rnorm(1001,sd=50)
# sort
ex = ex[order(ex[1],na.last=NA,decreasing=FALSE),]

# run mwStats
mwStats(ex,win=100)



