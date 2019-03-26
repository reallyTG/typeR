library(NonpModelCheck)


### Name: npmodelcheck
### Title: Hypothesis Testing for Covariate or Group effect in
###   Nonparametric Regression
### Aliases: npmodelcheck
### Keywords: ~kwd1 ~kwd2

### ** Examples

X = matrix(1,100,5)

X[,1] = rnorm(100)
X[,2] = rnorm(100)
X[,3] = rnorm(100)
X[,4] = rnorm(100)
X[,5] = rnorm(100)
Y = X[,3]^3 + rnorm(100)

npmodelcheck(X, Y, 2, p = 9, degree.pol = 0, kernel.type = "trun.normal", 
bandwidth = "GCV",  dim.red = 0)

npmodelcheck(X, Y, 3, p = 7, degree.pol = 0, kernel.type = "trun.normal", 
bandwidth = "CV",  dim.red = c(2,2))

npmodelcheck(X, Y, c(1,2), p = 11, degree.pol = 0, kernel.type = "box", 
bandwidth = "CV",  dim.red = c(1,10))

npmodelcheck(X, Y, c(3,4), p = 5, degree.pol = 0, kernel.type = "box", 
bandwidth = "CV",  dim.red = c(1,20))

npmodelcheck(rnorm(100), rnorm(100), 1, p = 5, degree.pol = 1, 
kernel.type = "box", bandwidth = "CV",  dim.red = c(1,20))



