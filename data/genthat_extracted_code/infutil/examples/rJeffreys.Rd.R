library(infutil)


### Name: rJeffreys
### Title: Randomly generate values distributed according to a Jeffreys
###   prior
### Aliases: rJeffreys
### Keywords: distributions models

### ** Examples

ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)
rJeffreys(100, Jeffreys(ltm.lsat))



