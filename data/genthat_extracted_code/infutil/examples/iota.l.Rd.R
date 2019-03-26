library(infutil)


### Name: iota.l
### Title: Lindley Information (i.e., Information Utility) Lower Bound
### Aliases: iota.l
### Keywords: models

### ** Examples

ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

iota.l(ltm.lsat)
iota.l(Jeffreys(ltm.lsat, return="nc"))



