library(bigmemory)


### Name: morder
### Title: Ordering and Permuting functions for "big.matrix" and "matrix"
###   objects
### Aliases: morder morderCols mpermute mpermuteCols

### ** Examples

m = matrix(as.double(as.matrix(iris)), nrow=nrow(iris))
morder(m, 1)
order(m[,1])

m[order(m[,1]), 2]
mpermute(m, cols=1)
m[,2]



