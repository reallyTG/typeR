library(kpodclustr)


### Name: kpod
### Title: Function for performing k-POD
### Aliases: kpod

### ** Examples

p <- 5
n <- 200
k <- 3
sigma <- 0.15
missing <- 0.20
Data <- makeData(p,n,k,sigma,missing)
X <- Data$Missing
Orig <- Data$Orig
truth <- Data$truth

kpod_result <- kpod(X,k)
kpodclusters <- kpod_result$cluster



