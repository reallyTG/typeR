library(advclust)


### Name: c_fuzzycluster
### Title: Combine fuzzy cluster result
### Aliases: c_fuzzycluster

### ** Examples

fuzzy.CM(iris[,1:4],K=2,m=2,max.iteration=20,threshold=1e-3,RandomNumber=1234)->cl1
fuzzy.GK(iris[,1:4],K=2,m=2,max.iteration=20,threshold=1e-3,RandomNumber=1234)->cl2
c_fuzzycluster(cl1,cl2)



