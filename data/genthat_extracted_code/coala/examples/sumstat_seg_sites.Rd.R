library(coala)


### Name: sumstat_seg_sites
### Title: Summary Statistic: Segregating Sites
### Aliases: sumstat_seg_sites

### ** Examples

model <- coal_model(5, 1) +
  feat_mutation(5) +
  sumstat_seg_sites("segsites")
stats <- simulate(model)
print(stats$segsites)



