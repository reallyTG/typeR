library(truncSP)


### Name: stls
### Title: Estimation of truncated regression models using the
###   Symmetrically Trimmed Least Squares (STLS) estimator
### Aliases: stls print,stls-method summary,stls-method
###   print,summary.stls-method coef,stls-method vcov,stls-method
###   residuals,stls-method fitted,stls-method
### Keywords: regression

### ** Examples

##Simulate a data.frame
n <- 10000
x1 <- runif(n,0,10)
x2 <- runif(n,0,10)
x3 <- runif(n,-5,5)
y <- 1-2*x1+x2+2*x3+rnorm(n,0,2)
d <- data.frame(y=y,x1=x1,x2=x2,x3=x3)

##Use a truncated subsample
dtrunc <- subset(d, y>0)
  
##Use stls to estimate the model
stls(y~x1+x2+x3, dtrunc, point=0, direction="left", beta="ml", covar=FALSE)


##Example using data "PM10trunc"
data(PM10trunc)

stlspm10 <- 
stls(PM10~cars+temp+wind.speed+temp.diff+wind.dir+hour+day, data=PM10trunc, point=2)

summary(stlspm10)




