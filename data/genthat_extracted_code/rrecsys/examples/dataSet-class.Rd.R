library(rrecsys)


### Name: dataSet-class
### Title: Dataset class.
### Aliases: dataSet-class dataSet nrow,dataSet-method ncol,dataSet-method
###   dim,dataSet-method rowRatings,dataSet-method
###   colRatings,dataSet-method numRatings,dataSet-method
###   [,dataSet,ANY,ANY,missing-method coerce,dataSet,matrix-method
###   rowAverages,dataSet-method colAverages,dataSet-method

### ** Examples

x <- matrix(sample(c(0:5), size = 100, replace = TRUE, 
  prob = c(.6,.08,.08,.08,.08,.08)), nrow = 20, byrow = TRUE)

x <- defineData(x)

colRatings(x)

rowRatings(x)

numRatings(x)

sparsity(x)

a <- x[1:10,2:3]





