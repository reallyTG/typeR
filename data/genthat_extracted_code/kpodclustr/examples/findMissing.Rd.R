library(kpodclustr)


### Name: findMissing
### Title: Function for finding indices of missing data in a matrix
### Aliases: findMissing

### ** Examples

p <- 2
n <- 100
k <- 3
sigma <- 0.25
missing <- 0.05
Data <- makeData(p,n,k,sigma,missing)
X <- Data$Missing
missing <- findMissing(X)



