library(e1071)


### Name: fclustIndex
### Title: Fuzzy Cluster Indexes (Validity/Performance Measures)
### Aliases: fclustIndex
### Keywords: cluster

### ** Examples

# a 2-dimensional example
x<-rbind(matrix(rnorm(100,sd=0.3),ncol=2),
         matrix(rnorm(100,mean=1,sd=0.3),ncol=2))
cl<-cmeans(x,2,20,verbose=TRUE,method="cmeans")
resultindexes <- fclustIndex(cl,x, index="all")
resultindexes   



