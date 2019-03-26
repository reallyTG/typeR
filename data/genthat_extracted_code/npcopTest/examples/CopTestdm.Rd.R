library(npcopTest)


### Name: CopTestdm
### Title: Test for break detection in copula with change-point known in
###   the marginal cumulative distributions
### Aliases: CopTestdm
### Keywords: nonparametric htest multivariate

### ** Examples



#Example 1: under the nulle hypothesis 
#of an abrupt change in the m.c.d.f. at time m=50 and no change in the copula

n=100
m=50
sigma = matrix(c(1,0.4,0.4,1),2,2)
mean1 = rep(0,2)
mean2 = rep(4,2)

X=matrix(rep(0,n*2),n,2)

for(j in 1:n) X[j,]=t(chol(sigma))%*%rnorm(2)

X[1:m,] = X[1:m,]+mean1
X[(m+1):n,] = X[(m+1):n,]+mean2

CopTestdm(X,b=0.5)


## No test: 
      
#Example 2: under the alternative hypothesis 
#of an abrupt change in the m.c.d.f at and in the copula time k=m=50  

n=100
m=50

mean1 = rep(0,2)
mean2 = rep(4,2)
sigma1 = matrix(c(1,0.2,0.2,1),2,2)
sigma2 = matrix(c(1,0.6,0.6,1),2,2)

X=matrix(rep(0,n*2),n,2)
for(j in 1:m) X[j,]=t(chol(sigma1))%*%rnorm(2) + mean1
for(j in (m+1):n) X[j,]=t(chol(sigma2))%*%rnorm(2) + mean2

CopTestdm(X,b=0.5)

  
#Example 3: under the alternative hypothesis 
#of abrupt changes in the m.c.d.f at times m=100 and 150 and in the copula at time k=50

n=200
m1 = 100
m2 = 150
k = 50

sigma1 = matrix(c(1,0.2,0.2,1),2,2)
sigma2 = matrix(c(1,0.6,0.6,1),2,2)

mean1 = rep(0,2)
mean2 = rep(2,2)
mean3 = rep(4,2)

X=matrix(rep(0,n*2),n,2)
for(j in 1:k) X[j,]=t(chol(sigma1))%*%rnorm(2)
for(j in (k+1):n) X[j,]=t(chol(sigma2))%*%rnorm(2)

X[1:m1,]=X[1:m1,]+mean1
X[(m1+1):m2,]=X[(m1+1):m2,]+mean2
X[(m2+1):n,]=X[(m2+1):n,]+mean3

CopTestdm(X,b=c(0.5,0.75))
## End(No test)



