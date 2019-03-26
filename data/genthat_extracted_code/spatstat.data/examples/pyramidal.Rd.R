library(spatstat.data)


### Name: pyramidal
### Title: Pyramidal Neurons in Cingulate Cortex
### Aliases: pyramidal
### Keywords: datasets spatial

### ** Examples

  if(require(spatstat)) {
pyr <- pyramidal
pyr$grp <- abbreviate(pyramidal$group, minlength=7)
plot(pyr, quote(plot(Neurons, pch=16, main=grp)), main="Pyramidal Neurons")
  }



