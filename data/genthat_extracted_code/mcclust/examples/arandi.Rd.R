library(mcclust)


### Name: arandi
### Title: (Adjusted) Rand Index for Clusterings
### Aliases: arandi
### Keywords: cluster

### ** Examples

 cl1 <- sample(1:3,10,replace=TRUE)
 cl2 <- c(cl1[1:5], sample(1:3,5,replace=TRUE))
 arandi(cl1,cl2)
 arandi(cl1,cl2,adjust=FALSE)


