library(npcopTest)


### Name: kn
### Title: Estimation of the location of the change point in the copula
### Aliases: kn

### ** Examples


#Example 1: Abrupt change in the m.c.d.f at time (known) m=50 
# and in the copula at time k=50 (to be estimated)
n=100
m=50
mean1 = rep(0,2)
mean2 = rep(4,2)
sigma1 = matrix(c(1,0.2,0.2,1),2,2)
sigma2 = matrix(c(1,0.6,0.6,1),2,2)

X=matrix(rep(0,n*2),n,2)
for(j in 1:m) X[j,]=t(chol(sigma1))%*%rnorm(2) + mean1
for(j in (m+1):n) X[j,]=t(chol(sigma2))%*%rnorm(2) + mean2

kn(X,b=0.5) 

## No test: 
#Example 2: Abrupt changes in the m.c.d.f at times (known) m=100 and 150
# and in the copula at time k=50 (to be estimated)
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

kn(X,b=c(0.5,0.75))
## End(No test)



