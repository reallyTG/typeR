library(spam)


### Name: rowSums
### Title: Form Row and Column Sums and Means
### Aliases: rowSums.spam colSums.spam rowMeans.spam colMeans.spam rowSums
###   colSums rowMeans colMeans rowSums,spam-method colSums,spam-method
###   rowMeans,spam-method colMeans,spam-method
### Keywords: manip

### ** Examples

x <- spam( rnorm(20), 5, 4)
rowSums( x)
c( x %*% rep(1,4))



