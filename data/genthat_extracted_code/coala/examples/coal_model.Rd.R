library(coala)


### Name: coal_model
### Title: Create a Coalescent Model
### Aliases: coal_model

### ** Examples

# A model with one population and 20 unlinked loci:
model <- coal_model(10, 20) +
  feat_mutation(5) +
  sumstat_tajimas_d()
check_model(model)
simulate(model)

# A model with two populations:
model <- coal_model(c(13, 18), 5) +
  feat_migration(.5, symmetric = TRUE) +
  sumstat_trees()
check_model(model)
simulate(model)

# A model with 10 populations:
model <- coal_model(rep(2, 10), 5) +
  feat_migration(.5, symmetric = TRUE) +
  sumstat_trees()
check_model(model)
simulate(model)

# A model with recombination:
model <- coal_model(20, 1, 1000) +
  feat_recombination(10) +
  feat_mutation(5) +
  sumstat_four_gamete()
check_model(model)
simulate(model)



