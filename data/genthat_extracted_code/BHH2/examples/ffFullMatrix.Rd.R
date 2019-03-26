library(BHH2)


### Name: ffFullMatrix
### Title: Full model matrix from a design matrix
### Aliases: ffFullMatrix
### Keywords: design

### ** Examples

print(X <- ffDesMatrix(5,gen=list(c(5,1,2,3,4))))
ffFullMatrix(X[,1:4],x=c(1,2,3,4),maxInt=2,blk=X[,5])
ffFullMatrix(X[,1:5],x=c(1,3,5),maxInt=3)



