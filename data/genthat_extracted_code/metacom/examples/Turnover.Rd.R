library(metacom)


### Name: Turnover
### Title: Determines species turnover
### Aliases: Turnover

### ** Examples


#define an interaction matrix
data(TestMatrices)
intmat <- TestMatrices[[3]]

#determine species turnover
turnover.intmat <- Turnover(intmat, method='r1', 
   sims=100, scores=1, binary=TRUE)




