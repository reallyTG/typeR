library(kpodclustr)


### Name: initialImpute
### Title: Function for initial imputation for k-means
### Aliases: initialImpute

### ** Examples

p <- 2
n <- 100
k <- 3
sigma <- 0.25
missing <- 0.05
Data <- makeData(p,n,k,sigma,missing)
X <- Data$Missing
X_copy <- initialImpute(X)



