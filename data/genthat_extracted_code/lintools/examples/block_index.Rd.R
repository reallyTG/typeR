library(lintools)


### Name: block_index
### Title: Find independent blocks of equations.
### Aliases: block_index

### ** Examples


 A <- matrix(c(
   1,0,2,0,0,
   3,0,4,0,0,
   0,5,0,6,7,
   0,8,0,0,9
 ),byrow=TRUE,nrow=4)
 b <- rep(0,4)
 bi <- block_index(A)
 lapply(bi,function(ii) compact(A[ii,,drop=FALSE],b=b[ii])$A)





