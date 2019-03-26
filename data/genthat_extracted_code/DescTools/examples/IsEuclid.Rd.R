library(DescTools)


### Name: IsEuclid
### Title: Is a Distance Matrix Euclidean?
### Aliases: IsEuclid summary.dist
### Keywords: arith

### ** Examples

w <- matrix(runif(10000), 100, 100)
w <- dist(w)
summary(w)
IsEuclid (w) # TRUE



