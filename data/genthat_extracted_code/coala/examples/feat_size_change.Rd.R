library(coala)


### Name: feat_size_change
### Title: Feature: Instantaneous Size Change
### Aliases: feat_size_change

### ** Examples

# A model with one smaller population:
model <- coal_model(c(20, 5), 3) +
  feat_size_change(.1, population = 2) +
  feat_mutation(1.0) +
  feat_migration(0.5, 2, 1) +
  sumstat_sfs()
simulate(model)

# A model of one population that experienced a bottleneck:
model <- coal_model(10, 1) +
  feat_size_change(0.1, time = 0.3) +
  feat_size_change(1.0, time = 0.5) +
  feat_mutation(20) +
  sumstat_sfs()
simulate(model)



