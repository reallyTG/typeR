library(coala)


### Name: feat_pop_merge
### Title: Feature: Population Merge
### Aliases: feat_pop_merge

### ** Examples

# Two population which merge after 0.5 time units:
model <- coal_model(c(25,25), 1) +
  feat_pop_merge(0.5, 2, 1) +
  feat_mutation(5) +
  sumstat_tajimas_d()
simulate(model)

# An standard isolation-with-migration model:
model_iwm <- model +
  feat_migration(.75, symmetric = TRUE)
simulate(model_iwm)



