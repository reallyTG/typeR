library(NonpModelCheck)


### Name: npvarselec
### Title: Variable selection for covariates in nonparametric regression
### Aliases: npvarselec
### Keywords: ~kwd1 ~kwd2

### ** Examples

d = 10	
X = matrix(1,90,d)

for (i in 1:d)
   X[,i] = rnorm(90)
Y = X[,3]^3 + X[,6]^2 + sin(1/2*pi*X[,9]) + rnorm(90)

npvarselec(X, Y, method = "forward", p = 9, degree.pol = 0, 
kernel.type = "trun.normal", bandwidth = "CV")



