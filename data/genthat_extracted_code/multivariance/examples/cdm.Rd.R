library(multivariance)


### Name: cdm
### Title: centered distance matrix
### Aliases: cdm

### ** Examples

x = coins(100)
cdm(x) # fast euclidean distances
cdm(x,psi = function(x,y) sqrt(sum((x-y)^2))) # this is identical to the previous (but slower)

# the function cdm does the following three lines in a faster way
N = nrow(x)
C = diag(N) - matrix(1/N,nrow = N,ncol = N)
A = - C %*% as.matrix(stats::dist(x,method="euclidean")) %*% C #'
all(abs(A- cdm(x,normalize = FALSE)) < 10^(-12))




