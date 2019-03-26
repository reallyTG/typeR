library(metacom)


### Name: Metacommunity
### Title: Analysis of the Elements of Metacommunity Structure
### Aliases: Metacommunity

### ** Examples

#define an interaction matrix
data(TestMatrices)
intmat <- TestMatrices[[7]]

#determines the elements of metacommunity structure
ems.test <- Metacommunity(intmat, method='r1', sims=100, scores=1)




