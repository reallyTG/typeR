library(kpodclustr)


### Name: assign_clustpp
### Title: Function for assigning clusters to rows in a matrix
### Aliases: assign_clustpp

### ** Examples

p <- 2
n <- 100
k <- 3
sigma <- 0.25
missing <- 0.05
Data <- makeData(p,n,k,sigma,missing)
X <- Data$Missing
Orig <- Data$Orig

clusts <- assign_clustpp(Orig, k)



