library(ReliabilityTheory)


### Name: simulateSystem
### Title: Simulate Masked Lifetime Data for a System
### Aliases: simulateSystem
### Keywords: simulate masked lifetime data system signature

### ** Examples

# Simulate 20 masked lifetimes of a two component series system with Exponential(2)
# component lifetimes
# Using igraph object ...
simulateSystem(graph.formula(s -- 1 -- 2 -- t), 20, rexp, rate=2)

# ... and using signature
simulateSystem(c(1,0), 20, rexp, rate=2)



