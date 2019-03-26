library(FossilSim)


### Name: plot.taxonomy
### Title: Plot simulated taxonomy
### Aliases: plot.taxonomy

### ** Examples

set.seed(123)

## simulate tree
t = TreeSim::sim.bd.taxa(8, 1, 1, 0.3)[[1]]

## simulate taxonomy
s = sim.taxonomy(t, 0.5, 1)

## plot the output
plot(s, t)




