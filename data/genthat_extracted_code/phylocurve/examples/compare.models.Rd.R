library(phylocurve)


### Name: compare.models
### Title: Compare evolutionary hypotheses
### Aliases: compare.models

### ** Examples

rand.data <- sim.traits()
X <- rowMeans(rand.data$trait_data)
null.model <- evo.model(tree = rand.data$tree,
  Y = rand.data$trait_data,method = "Pairwise ML")
alt.model <- evo.model(tree = rand.data$tree,
  Y = rand.data$trait_data,fixed.effects = X,method = "Pairwise ML")

compare.models(model1 = null.model,model2 = alt.model,
  nsim = 100,parallel = FALSE)



