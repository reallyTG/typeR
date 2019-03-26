library(mcclust)


### Name: vi.dist
### Title: Variation of Information Distance for Clusterings
### Aliases: vi.dist
### Keywords: cluster

### ** Examples

 cl1 <- sample(1:3,10,replace=TRUE)
 cl2 <- c(cl1[1:5], sample(1:3,5,replace=TRUE))
 vi.dist(cl1,cl2)
 vi.dist(cl1,cl2, parts=TRUE)



