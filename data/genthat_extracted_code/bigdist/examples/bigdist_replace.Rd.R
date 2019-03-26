library(bigdist)


### Name: bigdist_replace
### Title: Replace parts of bigdist
### Aliases: bigdist_replace

### ** Examples

set.seed(1)
amat <- matrix(rnorm(1e3), ncol = 10)
td   <- tempdir()
temp <- bigdist(mat = amat, file = file.path(td, "temp_ex7"))
bigdist_replace(temp, 1, 2, 10)
bigdist_extract(temp, 1, 2)
bigdist_replace(temp, 1:2, 3:4, 11:12)
bigdist_extract(temp, 1:2, 3:4, product = "inner")



