library(WVPlots)


### Name: DiscreteDistribution
### Title: Plot distribution of a single discrete numerical variable.
### Aliases: DiscreteDistribution

### ** Examples


frmx = data.frame(x = rbinom(1000, 20, 0.5))
WVPlots::DiscreteDistribution(frmx, "x","Discrete example")




