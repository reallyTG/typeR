library(fda)


### Name: fbplot
### Title: Functional Boxplots
### Aliases: fbplot boxplot.fd boxplot.fdPar boxplot.fdSmooth
### Keywords: ~Functional Boxplots

### ** Examples

##
## 1.  generate 50 random curves with some covariance structure
##     model 1 without outliers
##
cov.fun=function(d,k,c,mu){
        k*exp(-c*d^mu)
}
n=50
p=30
t=seq(0,1,len=p)
d=dist(t,upper=TRUE,diag=TRUE)
d.matrix=as.matrix(d)
#covariance function in time
t.cov=cov.fun(d.matrix,1,1,1)
# Cholesky Decomposition
L=chol(t.cov)
mu=4*t
e=matrix(rnorm(n*p),p,n)
y=mu+t(L)%*%e

#functional boxplot
fbplot(y,method='MBD',ylim=c(-11,15))

# The same using boxplot.fd
boxplot.fd(y, method='MBD', ylim=c(-11, 15))

# same with default ylim
boxplot.fd(y)

##
## 2.  as an fd object
##
Y <- Data2fd(y)
boxplot(Y)

##
## 3.  as an fdPar object
##
Ypar <- fdPar(Y)
boxplot(Ypar)

##
## 4.  Smoothed version
##
Ysmooth <- smooth.fdPar(Y)
boxplot(Ysmooth)

##
## 5.  model 2 with outliers
##
#magnitude
k=6
#randomly introduce outliers
C=rbinom(n,1,0.1)
s=2*rbinom(n,1,0.5)-1
cs.m=matrix(C*s,p,n,byrow=TRUE)

e=matrix(rnorm(n*p),p,n)
y=mu+t(L)%*%e+k*cs.m

#functional boxplot
fbplot(y,method='MBD',ylim=c(-11,15))




