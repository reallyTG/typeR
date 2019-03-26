library(metacom)


### Name: NullMaker
### Title: Null matrix creator
### Aliases: NullMaker
### Keywords: ordination

### ** Examples


#define an interaction matrix
data(TestMatrices)
intmat <- TestMatrices[[7]]

#creation of the null matrices
nulls <- NullMaker(intmat, sims=100, method='r1')




