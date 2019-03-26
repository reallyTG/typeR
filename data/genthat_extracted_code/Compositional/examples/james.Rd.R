library(Compositional)


### Name: James multivariate version of the t-test
### Title: James multivariate version of the t-test
### Aliases: james
### Keywords: Multivariate analysis of variance Unequality of the
###   covariance matrices

### ** Examples

james( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]), R = 1 )
james( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]), R = 2 )
james( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]) )
hotel2T2( as.matrix(iris[1:25, 1:4]), as.matrix(iris[26:50, 1:4]) )



