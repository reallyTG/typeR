library(markovchain)


### Name: predictiveDistribution
### Title: Function to compute the probability of observing a new data set,
###   given a data set
### Aliases: predictiveDistribution

### ** Examples

sequence<-c("a", "b", "a", "a", "a", "a", "b", "a", "b", "a", "b", "a", "a", 
"b", "b", "b", "a")
hyperMatrix<-matrix(c(1, 2, 1, 4), nrow = 2,dimnames=list(c("a","b"),c("a","b")))
predProb <- predictiveDistribution(sequence[1:10], sequence[11:17], hyperparam =hyperMatrix )
hyperMatrix2<-hyperMatrix[c(2,1),c(2,1)]
predProb2 <- predictiveDistribution(sequence[1:10], sequence[11:17], hyperparam =hyperMatrix2 )
predProb2==predProb



