library(coala)


### Name: sumstat_jsfs
### Title: Summary Statistic: Joint Site Frequency Spectrum
### Aliases: sumstat_jsfs

### ** Examples

model <- coal_model(c(2, 3, 4), 2) +
  feat_mutation(5) +
  feat_migration(1, symmetric = TRUE) +
  sumstat_jsfs("jsfs_12", populations = c(1, 2)) +
  sumstat_jsfs("jsfs_123", populations = c(1, 2, 3))
stats <- simulate(model)
print(stats$jsfs_12)
print(stats$jsfs_123)



