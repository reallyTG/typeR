library(advclust)


### Name: co.vote
### Title: Consensus / Ensemble Fuzzy Clustering: Voting
### Aliases: co.vote

### ** Examples

fuzzy.CM(iris[,1:4],K=2,m=2,max.iteration=20,threshold=1e-3,RandomNumber=1234)->cl1
fuzzy.GK(iris[,1:4],K=2,m=2,max.iteration=20,threshold=1e-3,RandomNumber=1234)->cl2
fuzzy.CM(iris[,1:4],K=2,m=2,max.iteration=20,threshold=1e-3,RandomNumber=1234)->cl3
c_fuzzycluster(cl1,cl2,cl3)->CL
co.vote(CL,"borda")



