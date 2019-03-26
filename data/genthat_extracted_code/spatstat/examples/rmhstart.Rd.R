library(spatstat)


### Name: rmhstart
### Title: Determine Initial State for Metropolis-Hastings Simulation.
### Aliases: rmhstart rmhstart.default
### Keywords: spatial datagen

### ** Examples

   # 30 random points
   a <- rmhstart(n.start=30)
   a

   # a particular point pattern
   b <- rmhstart(x.start=cells)



