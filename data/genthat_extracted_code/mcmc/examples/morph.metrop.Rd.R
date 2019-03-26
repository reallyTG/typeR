library(mcmc)


### Name: morph.metrop
### Title: Morphometric Metropolis Algorithm
### Aliases: morph.metrop morph.metrop.function
###   morph.metrop.morph.metropolis
### Keywords: misc

### ** Examples

out <- morph.metrop(function(x) dt(x, df=3, log=TRUE), 0, blen=100,
  nbatch=100, morph=morph(b=1))
# change the transformation.
out <- morph.metrop(out, morph=morph(b=2))
out$accept
# accept rate is high, increase the scale.
out <- morph.metrop(out, scale=4)
# close to 0.20 is about right.
out$accept



