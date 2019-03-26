library(sperrorest)


### Name: as.resampling
### Title: Resampling objects such as partitionings or bootstrap samples
### Aliases: as.resampling resampling as.resampling_default
###   as.resampling.default as.resampling.factor as.resampling_list
###   as.resampling.list validate.resampling is.resampling print.resampling

### ** Examples

data(ecuador) # Muenchow et al. (2012), see ?ecuador

# Partitioning by elevation classes in 200 m steps:
parti <- factor( as.character( floor( ecuador$dem / 200 ) ) )
smp <- as.resampling(parti)
summary(smp)
# Compare:
summary(parti)

# k-fold (non-spatial) cross-validation partitioning:
parti <- partition_cv(ecuador)
parti <- parti[[1]] # the first (and only) resampling object in parti
# data corresponding to the test sample of the first fold:
str( ecuador[ parti[[1]]$test , ])
# the corresponding training sample - larger:
str( ecuador[ parti[[1]]$train , ])

# Bootstrap training sets, out-of-bag test sets:
parti <- represampling_bootstrap(ecuador, oob = TRUE)
parti <- parti[[1]] # the first (and only) resampling object in parti
# out-of-bag test sample: approx. one-third of nrow(ecuador):
str( ecuador[ parti[[1]]$test , ])
# bootstrap training sample: same size as nrow(ecuador):
str( ecuador[ parti[[1]]$train , ])




