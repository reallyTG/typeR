library(agridat)


### Name: hunter.corn
### Title: Multi-environment trial of corn with nitrogen fertilizer
### Aliases: hunter.corn
### Keywords: datasets

### ** Examples


data(hunter.corn)
dat <- hunter.corn

dat <- transform(dat, env=factor(paste(loc,year)))

require(lattice)
xyplot(yield~nitro|env, dat, type='b',
main="hunter.corn - nitrogen response curves")




