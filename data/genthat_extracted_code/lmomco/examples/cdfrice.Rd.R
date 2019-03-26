library(lmomco)


### Name: cdfrice
### Title: Cumulative Distribution Function of the Rice Distribution
### Aliases: cdfrice
### Keywords: distribution cumulative distribution function Distribution:
###   Rice

### ** Examples

lmr <- vec2lmom(c(45,0.27), lscale=FALSE)
cdfrice(35,parrice(lmr))



