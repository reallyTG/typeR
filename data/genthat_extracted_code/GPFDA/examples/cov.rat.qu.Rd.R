library(GPFDA)


### Name: cov.rat.qu
### Title: Covariance function. Rational quadratic covariance function.
### Aliases: cov.rat.qu

### ** Examples

library(GPFDA)
require(MASS)

set.seed(30)
hp <- list('pow.ex.w'=log(10),'linear.a'=log(10),'pow.ex.v'=log(5),
      'vv'=log(1))
c <- seq(0,1,len=40)
idx <- sort(sample(1:40,21))
X <- as.matrix(c[idx])
Y <- (mvrnorm(n=40,mu=c-c,Sigma=(cov.linear(hp,c)+cov.pow.ex(hp,c)))[,1]
      )*0.1+sin(c*6)
Y <- as.matrix(Y[idx])
x <- as.matrix(seq(0,1,by=0.03))
a <- gpr(X,Y,c('rat.qu'))
b <- gppredict(a,x)

upper=b$pred.mean+1.96*b$pred.sd
lower=b$pred.mean-1.96*b$pred.sd
plot(-100,-100,col=0,xlim=range(x[,1]),ylim=c(min(upper,lower,Y)-
      0.1*abs(min(upper,lower,Y)),max(upper,lower,Y)+0.1*abs(max(upper,
      lower,Y))),main="Prediction", xlab="input ( x )",ylab="response")
polygon(c(x[,1], rev(x[,1])), c(upper, rev(lower)),col = "grey90", 
      border = NA)
points(X[,1],Y,pch=4,col=2)

lines(X[,1],Y)
lines(x[,1],b$pred.mean,col=3,lwd=2)



