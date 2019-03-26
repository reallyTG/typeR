library(sperrorest)


### Name: partition_cv
### Title: Partition the data for a (non-spatial) cross-validation
### Aliases: partition_cv

### ** Examples

data(ecuador)
## non-spatial cross-validation:
resamp <- partition_cv(ecuador, nfold = 5, repetition = 5)
# plot(resamp, ecuador)
# first repetition, second fold, test set indices:
idx <- resamp[['1']][[2]]$test
# test sample used in this particular repetition and fold:
ecuador[idx , ]



