library(multisom)


### Name: BatchSOM
### Title: Self-Organizing Map: Batch version
### Aliases: BatchSOM
### Keywords: Clustering

### ** Examples

data<-iris[,-c(5)]
BatchSOM(data,grid = somgrid(7,7,"hexagonal"),min.radius=0.0001,
              max.radius=0.002,maxit=1000,"random","gaussian")




