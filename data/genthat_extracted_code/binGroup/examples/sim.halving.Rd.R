library(binGroup)


### Name: sim.halving
### Title: Simulation Function for Group Testing Data for the Halving
###   Protocol
### Aliases: sim.halving
### Keywords: datagen

### ** Examples


set.seed(46)
gt.data <- sim.halving(par = c(-6, .1), gshape = 17, gscale = 1.4,
               sample.size = 5000, group.size = 5,
               sens = 0.95, spec = 0.95)




