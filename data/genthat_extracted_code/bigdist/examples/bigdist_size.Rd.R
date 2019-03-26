library(bigdist)


### Name: bigdist_size
### Title: Size of bigdist
### Aliases: bigdist_size

### ** Examples

set.seed(1)
amat <- matrix(rnorm(1e3), ncol = 10)
td   <- tempdir()
temp <- bigdist(mat = amat, file = file.path(td, "temp_ex5"))
bigdist_size(temp)



