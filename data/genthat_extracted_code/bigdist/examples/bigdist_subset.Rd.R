library(bigdist)


### Name: bigdist_subset
### Title: Subset parts of bigdist
### Aliases: bigdist_subset

### ** Examples

set.seed(1)
amat <- matrix(rnorm(1e3), ncol = 10)
td   <- tempdir()
temp <- bigdist(mat = amat, file = file.path(td, "temp_ex8"))
temp_subset <- bigdist_subset(temp, index = 21:30, file = file.path(td, "temp_ex9"))
temp_subset
temp_subset$fbm$backingfile



