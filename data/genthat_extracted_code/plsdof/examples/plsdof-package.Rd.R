library(plsdof)


### Name: plsdof-package
### Title: Degrees of Freedom and Statistical Inference for Partial Least
###   Squares Regression
### Aliases: plsdof-package plsdof
### Keywords: package

### ** Examples

# Boston Housing data
data(Boston)
X<-as.matrix(Boston[,-14])
y<-as.vector(Boston[,14])

# compute PLS coefficients for the first 5 components and plot Degrees of Freedom

my.pls1<-pls.model(X,y,m=5,compute.DoF=TRUE)

plot(0:5,my.pls1$DoF,pch="*",cex=3,xlab="components",ylab="DoF",ylim=c(0,14))

# add naive estimate
lines(0:5,1:6,lwd=3)

# model selection with the Bayesian Information criterion

mypls2<-pls.ic(X,y,criterion="bic")

# model selection based on cross-validation. 
# returns the estimated covariance matrix of the regression coefficients

mypls3<-pls.cv(X,y,compute.covariance=TRUE)
my.vcov<-vcov(mypls3)
my.sd<-sqrt(diag(my.vcov)) # standard deviation of the regression coefficients




