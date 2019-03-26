library(agridat)


### Name: theobald.barley
### Title: Multi-environment trial of barley, multiple years & fertilizer
###   levels
### Aliases: theobald.barley
### Keywords: datasets

### ** Examples


data(theobald.barley)
dat <- theobald.barley
dat <- transform(dat,  env=paste(loc,year,sep="-"))
dat <- transform(dat, income=100*yield - 400*nitro/1000)

require(lattice)
xyplot(income~nitro|env, dat, groups=gen, type='b',
       auto.key=list(columns=3), main="theobald.barley")




