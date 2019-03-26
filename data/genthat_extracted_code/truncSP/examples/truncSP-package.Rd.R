library(truncSP)


### Name: truncSP-package
### Title: Estimators of semi-parametric truncated regression models
### Aliases: truncSP-package truncSP
### Keywords: package

### ** Examples

 ##Simulate a data.frame (model with asymmetrically distributed errors)
n <- 10000
x1 <- runif(n,0,10)
x2 <- runif(n,0,10)
x3 <- runif(n,-5,5)
eps <- rexp(n,0.2)- 5
y <- 2-2*x1+x2+2*x3+eps
d <- data.frame(y=y,x1=x1,x2=x2,x3=x3)
   
##Use a truncated subsample
dtrunc <- subset(d, y>0)

##Use qme or lt to consistently estimate the slope parameters
qme(y~x1+x2+x3, dtrunc, point=0, direction="left", cval="ols", const=1, 
   beta="ols", covar=FALSE)
lt(y~x1+x2+x3, dtrunc, point=0, direction="left", clower="ols", const=1, 
   cupper=2, beta="ols", covar=FALSE)
   
##Simulate a data.frame (symmetrically distributed errors)
n <- 10000
x1 <- runif(n,0,10)
x2 <- runif(n,0,10)
x3 <- runif(n,-5,5)
y <- 1-2*x1+x2+2*x3+rnorm(n,0,2)
d <- data.frame(y=y,x1=x1,x2=x2,x3=x3)

##Use a truncated subsample
dtrunc <- subset(d, y>0)
  
##Use stls to estimate the model
stls(y~x1+x2+x3, dtrunc, point=0, direction="left", beta="ols", covar=FALSE)



