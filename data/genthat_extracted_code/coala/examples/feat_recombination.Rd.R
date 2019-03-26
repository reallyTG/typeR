library(coala)


### Name: feat_recombination
### Title: Feature: Recombination
### Aliases: feat_recombination

### ** Examples

# Simulate a 1.5kb sequence for 10 individuals with recombination:
model <- coal_model(10, 2, 1500) +
  feat_recombination(1.5) +
  feat_mutation(5) +
  sumstat_sfs()
simulate(model)



