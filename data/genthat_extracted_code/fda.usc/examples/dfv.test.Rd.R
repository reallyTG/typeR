library(fda.usc)


### Name: dfv.test
### Title: Delsol, Ferraty and Vieu test for no functional-scalar
###   interaction
### Aliases: dfv.test dfv.statistic
### Keywords: htest models regression

### ** Examples


## Simulated example ##

X=rproc2fdata(n=50,t=seq(0,1,l=101),sigma="OU")

beta0=fdata(mdata=rep(0,length=101)+rnorm(101,sd=0.05),
argvals=seq(0,1,l=101),rangeval=c(0,1))
beta1=fdata(mdata=cos(2*pi*seq(0,1,l=101))-(seq(0,1,l=101)-0.5)^2+
rnorm(101,sd=0.05),argvals=seq(0,1,l=101),rangeval=c(0,1))

# Null hypothesis holds
Y0=drop(inprod.fdata(X,beta0)+rnorm(50,sd=0.1))

# Null hypothesis does not hold
Y1=drop(inprod.fdata(X,beta1)+rnorm(50,sd=0.1))

# We use the CV bandwidth given by fregre.np
# Do not reject H0
dfv.test(X,Y0,h=fregre.np(X,Y0)$h.opt,B=100)
# dfv.test(X,Y0,B=5000)

# Reject H0
dfv.test(X,Y1,B=100)
# dfv.test(X,Y1,B=5000)




