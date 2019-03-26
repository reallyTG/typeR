library(biganalytics)


### Name: colmin
### Title: Basic summary statistics for "big.matrix" objects
### Aliases: colmax colmax,big.matrix-method colmean
###   colmean,big.matrix-method colmin colmin,big.matrix-method
###   colmin,min,colmax,max,colprod,prod,colsum,sum,colrange,range,colmean,mean,colvar,var,colsd,sd,colna,summary
###   colna colna,big.matrix-method colprod colprod,big.matrix-method
###   colrange colrange,big.matrix-method colsd colsd,big.matrix-method
###   colsum colsum,big.matrix-method colvar colvar,big.matrix-method
###   max,big.matrix-method mean,big.matrix-method min,big.matrix-method
###   prod,big.matrix-method range,big.matrix-method sum,big.matrix-method
###   summary,big.matrix-method

### ** Examples

x <- as.big.matrix(
  matrix( sample(1:10, 20, replace=TRUE), 5, 4,
          dimnames=list( NULL, c("a", "b", "c", "d")) ) )
x[,]
mean(x)
colmean(x)
colmin(x)
colmin(x, 1)
colmax(x)
colmax(x, "b")
colsd(x)
colrange(x)
range(x)
colsum(x)
colprod(x)



