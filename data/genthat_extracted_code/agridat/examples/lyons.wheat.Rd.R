library(agridat)


### Name: lyons.wheat
### Title: Multi-environment trial of winter wheat at 12 sites in 4 years.
### Aliases: lyons.wheat
### Keywords: datasets

### ** Examples


data(lyons.wheat)
dat <- lyons.wheat

require(lattice)
xyplot(yield~factor(year), dat, group=loc,
  main="lyons.wheat",
  auto.key=list(columns=4), type=c('p','l'))



