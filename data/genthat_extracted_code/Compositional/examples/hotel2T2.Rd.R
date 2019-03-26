library(Compositional)


### Name: Hotelling's multivariate version of the 2 sample t-test for Euclidean data
### Title: Hotelling's multivariate version of the 2 sample t-test for
###   Euclidean data
### Aliases: hotel2T2
### Keywords: Multivariate analysis of variance Equality of the covariance
###   matrices

### ** Examples

hotel2T2( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]) )
hotel2T2( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]), R = 1 )
james( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]) )
james( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]), R = 1 )



