library(asbio)


### Name: DH.test
### Title: Doornik-Hansen test for multivariate normality.
### Aliases: DH.test
### Keywords: htest multivariate

### ** Examples

data(iris)#The ubiquitous multivariate iris data.
DH.test(iris[,1:4],Y.names=names(iris[,1:4]))



