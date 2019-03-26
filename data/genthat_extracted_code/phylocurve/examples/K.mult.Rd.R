library(phylocurve)


### Name: K.mult
### Title: Test phylogenetic signal (Kmult) using phylogenetic simulation
### Aliases: K.mult

### ** Examples

rand.data <- sim.traits()
null.model <- evo.model(tree = rand.data$tree,
  Y = rand.data$trait_data,method = "Pairwise ML")

K.mult(model = null.model,nsim = 100)



