library(coala)


### Name: sumstat_tajimas_d
### Title: Summary Statistic: Tajima's D
### Aliases: sumstat_tajimas_d

### ** Examples

# A neutral model that should yield values close to zero:
model <- coal_model(5, 2) +
  feat_mutation(20) +
  feat_recombination(10) +
  sumstat_tajimas_d("taji_d")
stats <- simulate(model)
print(stats$taji_d)



