library(bigdist)


### Name: bigdist_extract
### Title: Extract parts of bigdist
### Aliases: bigdist_extract

### ** Examples

set.seed(1)
amat <- matrix(rnorm(1e3), ncol = 10)
td   <- tempdir()
temp <- bigdist(mat = amat, file = file.path(td, "temp_ex6"))
bigdist_extract(temp, 1, 2)
bigdist_extract(temp, 1:2, 3:4)
bigdist_extract(temp, 1:2, 3:4, product = "inner")
dim(bigdist_extract(temp, 1:2,))
dim(bigdist_extract(temp, , 3:4))



