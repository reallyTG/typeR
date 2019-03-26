library(coala)


### Name: feat_migration
### Title: Feature: Migration/Gene Flow
### Aliases: feat_migration

### ** Examples

# Asymmetric migration between two populations:
model <- coal_model(c(5, 5), 10) +
  feat_migration(0.5, 1, 2) +
  feat_migration(1.0, 2, 1) +
  feat_mutation(5) +
  sumstat_sfs()
simulate(model)

# Three populations that exchange migrations with equal
# rates at times more than 0.5 time units in the past:
model <- coal_model(c(3, 4, 5), 2) +
  feat_migration(1.2, symmetric = TRUE, time = 0.5) +
  feat_mutation(5) +
  sumstat_sfs()
simulate(model)



