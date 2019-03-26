library(spdep)


### Name: ssw
### Title: Compute the sum of dissimilarity
### Aliases: ssw
### Keywords: cluster multivariate

### ** Examples

data(USArrests)
n <- nrow(USArrests)
ssw(USArrests, 1:n)
ssw(USArrests, 1:(n/2))
ssw(USArrests, (n/2+1):n)
ssw(USArrests, 1:(n/2)) + ssw(USArrests, (n/2+1):n)



