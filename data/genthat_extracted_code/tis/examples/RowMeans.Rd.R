library(tis)


### Name: RowMeans
### Title: Form Row Sums and Means
### Aliases: RowSums RowSums.default RowSums.tis RowMeans RowMeans.default
###   RowMeans.tis
### Keywords: array algebra ts

### ** Examples

mat <- tis(matrix(1:36, ncol = 3), start = latestJanuary())
cbind(mat, rowSums(mat), rowMeans(mat))



