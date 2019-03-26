library(coala)


### Name: sumstat_sfs
### Title: Summary Statistic: Site Frequency Spectrum
### Aliases: sumstat_sfs

### ** Examples

model <- coal_model(20, 500) +
  feat_mutation(2) +
  sumstat_sfs()
stats <- simulate(model)
barplot(stats$sfs)



