library(epiphy)


### Name: indAndSub
### Title: Retrieve vector or array indices
### Aliases: indAndSub ind2sub sub2ind
### Keywords: internal

### ** Examples

set.seed(12345)
mat <- matrix(round(runif(6, min = 0, max = 10)), nrow = 2, ncol = 3)
ind2sub(4, dim(mat))
sub2ind(c(2, 2), dim(mat))
subs <- as.matrix(expand.grid(1:2,2:3))
sub2ind(subs, dim(mat))




