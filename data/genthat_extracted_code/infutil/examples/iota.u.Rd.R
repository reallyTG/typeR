library(infutil)


### Name: iota.u
### Title: Lindley Information (i.e., Information Utility) Upper Bound
### Aliases: iota.u
### Keywords: models

### ** Examples

ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

iota.u(Jeffreys(ltm.lsat))
iota.u(Jeffreys(ltm.lsat), range.int=c(-20,20))



