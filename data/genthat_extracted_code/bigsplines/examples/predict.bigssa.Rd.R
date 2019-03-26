library(bigsplines)


### Name: predict.bigssa
### Title: Predicts for "bigssa" Objects
### Aliases: predict.bigssa

### ** Examples


##########   EXAMPLE 1   ##########

# define univariate function and data
set.seed(773)
myfun <- function(x){ 2 + x + sin(2*pi*x) }
x <- runif(500)
y <- myfun(x) + rnorm(500)

# fit cubic spline model
cubmod <- bigssa(y~x,type="cub",nknots=30)
crossprod( predict(cubmod) - myfun(x) )/500

# define new data for prediction
newdata <- data.frame(x=seq(0,1,length.out=100))

# get fitted values and standard errors for new data
yc <- predict(cubmod,newdata,se.fit=TRUE)

# plot results with 95% Bayesian confidence interval
plot(newdata$x,yc$fit,type="l")
lines(newdata$x,yc$fit+qnorm(.975)*yc$se.fit,lty=3)
lines(newdata$x,yc$fit-qnorm(.975)*yc$se.fit,lty=3)

# predict constant, linear, and nonlinear effects
yc0 <- predict(cubmod,newdata,se.fit=TRUE,effect="0")
ycl <- predict(cubmod,newdata,se.fit=TRUE,effect="lin")
ycn <- predict(cubmod,newdata,se.fit=TRUE,effect="non")
crossprod( yc$fit - (yc0$fit + ycl$fit + ycn$fit) )

# plot results with 95% Bayesian confidence intervals
par(mfrow=c(1,2))
plot(newdata$x,ycl$fit,type="l",main="Linear effect")
lines(newdata$x,ycl$fit+qnorm(.975)*ycl$se.fit,lty=3)
lines(newdata$x,ycl$fit-qnorm(.975)*ycl$se.fit,lty=3)
plot(newdata$x,ycn$fit,type="l",main="Nonlinear effect")
lines(newdata$x,ycn$fit+qnorm(.975)*ycn$se.fit,lty=3)
lines(newdata$x,ycn$fit-qnorm(.975)*ycn$se.fit,lty=3)
         
         
##########   EXAMPLE 2   ##########

# define bivariate function and data
set.seed(773)
myfun<-function(x){
  2 + x[,1]/10 - x[,2]/5 + 2*sin(sqrt(x[,1]^2+x[,2]^2+.1))/sqrt(x[,1]^2+x[,2]^2+.1)
}
x1v <- runif(500)*16-8
x2v <- runif(500)*16-8
y <- myfun(cbind(x1v,x2v)) + rnorm(500)

# tensor product cubic splines with 50 knots
cubmod <- bigssa(y~x1v*x2v,type=list(x1v="cub",x2v="cub"),nknots=50)
crossprod( predict(cubmod) - myfun(cbind(x1v,x2v)) )/500

# define new data for prediction
xnew <- as.matrix(expand.grid(seq(-8,8,l=50),seq(-8,8,l=50)))
newdata <- list(x1v=xnew[,1],x2v=xnew[,2])

# get fitted values for new data
yp <- predict(cubmod,newdata)

# plot results
imagebar(seq(-8,8,l=50),seq(-8,8,l=50),matrix(yp,50,50),
         xlab=expression(italic(x)[1]),ylab=expression(italic(x)[2]),
         zlab=expression(hat(italic(y))))

# predict linear and nonlinear effects for x1v
newdata <- list(x1v=seq(-8,8,length.out=100))
yl <- predict(cubmod,newdata,include="x1v",effect="lin",se.fit=TRUE)
yn <- predict(cubmod,newdata,include="x1v",effect="non",se.fit=TRUE)

# plot results with 95% Bayesian confidence intervals
par(mfrow=c(1,2))
plot(newdata$x1v,yl$fit,type="l",main="Linear effect")
lines(newdata$x1v,yl$fit+qnorm(.975)*yl$se.fit,lty=3)
lines(newdata$x1v,yl$fit-qnorm(.975)*yl$se.fit,lty=3)
plot(newdata$x1v,yn$fit,type="l",main="Nonlinear effect",ylim=c(-.3,.4))
lines(newdata$x1v,yn$fit+qnorm(.975)*yn$se.fit,lty=3)
lines(newdata$x1v,yn$fit-qnorm(.975)*yn$se.fit,lty=3)




