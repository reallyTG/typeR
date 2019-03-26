library(crs)


### Name: uniquecombs
### Title: Find the unique rows in a matrix
### Aliases: uniquecombs
### Keywords: models regression

### ** Examples

X<-matrix(c(1,2,3,1,2,3,4,5,6,1,3,2,4,5,6,1,1,1),6,3,byrow=TRUE)
print(X)
Xu <- uniquecombs(X);Xu
ind <- attr(Xu,"index")
## find the value for row 3 of the original from Xu
Xu[ind[3],];X[3,]



