library(qtl)


### Name: locateXO
### Title: Estimate locations of crossovers
### Aliases: locateXO
### Keywords: utilities

### ** Examples

data(hyper)
xoloc <- locateXO(hyper, chr=4)
table(sapply(xoloc, length))



