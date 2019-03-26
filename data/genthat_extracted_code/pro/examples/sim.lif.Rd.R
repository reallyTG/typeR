library(pro)


### Name: sim.lif
### Title: Simulate optogenetic stimulation on a leaky-integrate-fire
###   neuron
### Aliases: sim.lif

### ** Examples

n<- 500
set.seed(100)
re <- sim.lif(n, rbinom(n, 1, 0.14), 7, 3)



