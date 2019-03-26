library(coala)


### Name: feat_growth
### Title: Feature: Exponential population size growth/decline
### Aliases: feat_growth

### ** Examples

# Simulate a haploid population that has been expanding for
# the last 2*Ne generations
model <- coal_model(10, 1) +
  feat_growth(5, time = 0) +
  feat_growth(0, time = 1) +
  feat_mutation(10) +
  sumstat_sfs()
simulate(model)



