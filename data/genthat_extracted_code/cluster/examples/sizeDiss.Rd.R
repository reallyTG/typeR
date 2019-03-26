library(cluster)


### Name: sizeDiss
### Title: Sample Size of Dissimilarity Like Object
### Aliases: sizeDiss
### Keywords: utilities arith

### ** Examples

sizeDiss(1:10)# 5, since 10 == 5 * (5 - 1) / 2
sizeDiss(1:9) # NA

n <- 1:100
stopifnot(n == sapply( n*(n-1)/2, function(n) sizeDiss(logical(n))))



