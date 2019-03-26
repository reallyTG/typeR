library(truncSP)


### Name: lt
### Title: Estimation of truncated regression models using the Left
###   Truncated (LT) estimator
### Aliases: lt print,lt-method summary,lt-method print,summary.lt-method
###   coef,lt-method vcov,lt-method residuals,lt-method fitted,lt-method
### Keywords: regression

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

##Use lt to consistently estimate the slope parameters
lt(y~x1+x2+x3, dtrunc, point=0, direction="left", clower="ml", const=1, 
   cupper=2, beta="ml", covar=FALSE)
   
##Example using data "PM10trunc"
data(PM10trunc)

ltpm10 <- lt(PM10~cars+temp+wind.speed+temp.diff+wind.dir+hour+day, 
   data=PM10trunc, point=2, control=list(maxit=2500))

summary(ltpm10)




