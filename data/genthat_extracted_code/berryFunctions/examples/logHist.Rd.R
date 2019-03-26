library(berryFunctions)


### Name: logHist
### Title: Histogram of logarithmic values
### Aliases: logHist
### Keywords: aplot dplot

### ** Examples


dat <- rbeta(1e4, 2, 18)*100
hist(dat, col="tan", breaks=50)
logHist(dat)
logHist(dat, freq=FALSE)
logHist(dat, breaks=50)
logHist(dat,xlim=c(0,2)) # xlim in powers of ten
logHist(c(-1,0,1,2,2,3,3,4,8,10,50)) # warning for negative values




