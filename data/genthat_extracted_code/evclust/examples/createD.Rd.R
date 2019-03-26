library(evclust)


### Name: createD
### Title: Computation of a Euclidean distance matrix
### Aliases: createD

### ** Examples

data(fourclass)
x<-as.matrix(fourclass[,1:2])
dist<-createD(x,k=10)
dim(dist$D)
dim(dist$J)




