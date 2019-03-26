library(sperrorest)


### Name: partition_factor
### Title: Partition the data for a (non-spatial) leave-one-factor-out
###   cross-validation based on a given, fixed partitioning
### Aliases: partition_factor

### ** Examples

data(ecuador)
# I don't recommend using this partitioning for cross-validation,
# this is only for demonstration purposes:
breaks <- quantile(ecuador$dem, seq(0, 1, length = 6))
ecuador$zclass <- cut(ecuador$dem, breaks, include.lowest = TRUE)
summary(ecuador$zclass)
parti <- partition_factor(ecuador, fac = 'zclass')
# plot(parti,ecuador)
summary(parti)



