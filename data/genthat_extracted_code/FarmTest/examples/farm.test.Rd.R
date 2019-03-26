library(FarmTest)


### Name: farm.test
### Title: Main function performing factor-adjusted robust test for means
### Aliases: farm.test

### ** Examples

set.seed(100)
p = 100
n = 50
epsilon = matrix(rnorm( p*n, 0,1), nrow = n)
B = matrix(runif(p*3,-2,2), nrow=p)
fx = matrix(rnorm(3*n, 0,1), nrow = n)
mu = rep(0, p)
mu[1:5] = 2
X = rep(1,n)%*%t(mu)+fx%*%t(B)+ epsilon
output = farm.test(X, cv=FALSE)#robust, no cross-validation
output

#other robustification options
output = farm.test(X, robust = FALSE, verbose=FALSE) #non-robust
output = farm.test(X, tau = 3, cv=FALSE, verbose=FALSE) #robust, no cross-validation, specified tau
#output = farm.test(X) #robust, cross-validation, longer running

#two sample test
n2 = 25
epsilon = matrix(rnorm( p*n2, 0,1), nrow = n2)
B = matrix(rnorm(p*3,0,1), nrow=p)
fy = matrix(rnorm(3*n2, 0,1), nrow = n2)
Y = fy%*%t(B)+ epsilon
output = farm.test(X=X,Y=Y, robust=FALSE)
output = farm.test(X=X,Y=Y,Kx=0, cv = FALSE) #non-robust
names(output$means)




