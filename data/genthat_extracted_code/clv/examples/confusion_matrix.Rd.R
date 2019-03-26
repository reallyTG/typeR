library(clv)


### Name: confusion.matrix
### Title: Confusion Matrix - External Measures, Cluster Stability
### Aliases: confusion.matrix
### Keywords: cluster

### ** Examples

# create two different subsamples 
mx1 <- matrix(as.integer( c(1,2,3,4,5,6,1,1,2,2,3,3) ), 6, 2 )
mx2 <- matrix(as.integer( c(1,2,4,5,6,7,1,1,2,2,3,3) ), 6, 2 )
# find section
m = cls.set.section(mx1,mx2)
confusion.matrix(as.integer(m[,2]),as.integer(m[,3]))



