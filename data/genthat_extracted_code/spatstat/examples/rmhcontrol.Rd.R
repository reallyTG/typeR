library(spatstat)


### Name: rmhcontrol
### Title: Set Control Parameters for Metropolis-Hastings Algorithm.
### Aliases: rmhcontrol rmhcontrol.default
### Keywords: spatial datagen

### ** Examples

   # parameters given as named arguments
   c1 <- rmhcontrol(p=0.3,periodic=TRUE,nrep=1e6,nverb=1e5)

   # parameters given as a list
   liz <- list(p=0.9, nrep=1e4)
   c2 <- rmhcontrol(liz)

   # parameters given in rmhcontrol object
   c3 <- rmhcontrol(c1)



