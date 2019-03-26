library(osc)


### Name: osc.buffer
### Title: Simple Buffer algorithm
### Aliases: osc.buffer
### Keywords: utils

### ** Examples

data(landcover)
landcover[landcover[]>1] <- 0
plot(osc.buffer(landcover, 4))



