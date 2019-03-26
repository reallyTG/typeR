library(truncSP)


### Name: qme
### Title: Estimation of truncated regression models using the Quadratic
###   Mode Estimator (QME)
### Aliases: qme print,qme-method summary,qme-method
###   print,summary.qme-method coef,qme-method vcov,qme-method
###   residuals,qme-method fitted,qme-method
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

##Use qme to consistently estimate the slope parameters
qme(y~x1+x2+x3, dtrunc, point=0, direction="left", cval="ml", const=1, 
   beta="ml", covar=FALSE)
   
##Example using data "PM10trunc"
data(PM10trunc)

qmepm10 <- qme(PM10~cars+temp+wind.speed+temp.diff+wind.dir+hour+day, 
   data=PM10trunc, point=2, control=list(maxit=4500))

summary(qmepm10)




