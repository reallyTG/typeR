library(coala)


### Name: sumstat_mcmf
### Title: Summary Statistic: Most Common Mutation's Frequency
### Aliases: sumstat_mcmf

### ** Examples

# Calculate MCMF for a panmictic population
model <- coal_model(10, 2) +
  feat_mutation(50) +
  sumstat_mcmf()
simulate(model)



