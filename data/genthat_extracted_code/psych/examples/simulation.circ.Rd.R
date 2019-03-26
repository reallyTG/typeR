library(psych)


### Name: simulation.circ
### Title: Simulations of circumplex and simple structure
### Aliases: simulation.circ circ.simulation simulation.circ circ.sim.plot
### Keywords: multivariate datagen

### ** Examples

#not run
demo <- simulation.circ()
boxplot(demo[3:14])
title("4 tests of Circumplex Structure",sub="Circumplex, Ellipsoid, Simple Structure")
circ.sim.plot(demo[3:14])  #compare these results to real data



