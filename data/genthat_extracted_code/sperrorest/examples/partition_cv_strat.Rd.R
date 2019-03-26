library(sperrorest)


### Name: partition_cv_strat
### Title: Partition the data for a stratified (non-spatial)
###   cross-validation
### Aliases: partition_cv_strat

### ** Examples

data(ecuador)
parti <- partition_cv_strat(ecuador, strat = 'slides', nfold = 5,
repetition = 1)
idx <- parti[['1']][[1]]$train
mean(ecuador$slides[idx] == 'TRUE') / mean(ecuador$slides == 'TRUE')
# always == 1
# Non-stratified cross-validation:
parti <- partition_cv(ecuador, nfold = 5, repetition = 1)
idx <- parti[['1']][[1]]$train
mean(ecuador$slides[idx] == 'TRUE') / mean(ecuador$slides == 'TRUE')
# close to 1 because of large sample size, but with some random variation



