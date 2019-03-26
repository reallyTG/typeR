library(softImpute)


### Name: SparseplusLowRank-class
### Title: Class '"SparseplusLowRank"'
### Aliases: SparseplusLowRank-class %*%,ANY,SparseplusLowRank-method
###   %*%,SparseplusLowRank,ANY-method %*%,Matrix,SparseplusLowRank-method
###   %*%,SparseplusLowRank,Matrix-method
###   as.matrix,SparseplusLowRank-method colMeans,SparseplusLowRank-method
###   colSums,SparseplusLowRank-method dim,SparseplusLowRank-method
###   norm,SparseplusLowRank,character-method
###   rowMeans,SparseplusLowRank-method rowSums,SparseplusLowRank-method
### Keywords: classes

### ** Examples

showClass("SparseplusLowRank")
x=matrix(sample(c(3,0),15,replace=TRUE),5,3)
x=as(x,"sparseMatrix")
a=matrix(rnorm(10),5,2)
b=matrix(rnorm(6),3,2)
new("SparseplusLowRank",x=x,a=a,b=b)
splr(x,a,b)



