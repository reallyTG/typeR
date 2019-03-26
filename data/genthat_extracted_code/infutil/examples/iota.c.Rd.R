library(infutil)


### Name: iota.c
### Title: Estimate the Criterion Information Utility
### Aliases: iota.c
### Keywords: models

### ** Examples

ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)	
iota.c.lsat <- iota.c(ltm.lsat, M=100) # typically more Monte Carlo replications would be used
iota.c.lsat




