library(sortinghat)


### Name: cv_partition
### Title: Partitions data for cross-validation.
### Aliases: cv_partition

### ** Examples

library(MASS)
# The following three calls to \code{cv_partition} yield the same partitions.
set.seed(42)
cv_partition(iris$Species)
cv_partition(iris$Species, num_folds = 10, seed = 42)
cv_partition(iris$Species, hold_out = 15, seed = 42)



