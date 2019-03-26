library(bigsplines)


### Name: predict.bigssg
### Title: Predicts for "bigssg" Objects
### Aliases: predict.bigssg

### ** Examples


##########   EXAMPLE 1   ##########

# define univariate function and data
set.seed(1)
myfun <- function(x){ sin(2*pi*x) }
ndpts <- 1000
x <- runif(ndpts)

# negative binomial response (unknown dispersion)
set.seed(773)
lp <- myfun(x)
mu <- exp(lp)
y <- rnbinom(n=ndpts,size=2,mu=mu)

# fit cubic spline model
cubmod <- bigssg(y~x,family="negbin",type="cub",nknots=20)
1/cubmod$dispersion   ## dispersion = 1/size
crossprod( lp - cubmod$linear.predictor )/length(lp)

# define new data for prediction
newdata <- data.frame(x=seq(0,1,length.out=100))

# get fitted values and standard errors for new data
yc <- predict(cubmod,newdata,se.lp=TRUE)

# plot results with 95% Bayesian confidence interval (link scale)
plot(newdata$x,yc$linear.predictor,type="l")
lines(newdata$x,yc$linear.predictor+qnorm(.975)*yc$se.lp,lty=3)
lines(newdata$x,yc$linear.predictor-qnorm(.975)*yc$se.lp,lty=3)

# plot results with 95% Bayesian confidence interval (data scale)
plot(newdata$x,yc$fitted,type="l")
lines(newdata$x,exp(yc$linear.predictor+qnorm(.975)*yc$se.lp),lty=3)
lines(newdata$x,exp(yc$linear.predictor-qnorm(.975)*yc$se.lp),lty=3)

# predict constant, linear, and nonlinear effects
yc0 <- predict(cubmod,newdata,se.lp=TRUE,effect="0")
ycl <- predict(cubmod,newdata,se.lp=TRUE,effect="lin")
ycn <- predict(cubmod,newdata,se.lp=TRUE,effect="non")
crossprod( yc$linear - (yc0$linear + ycl$linear + ycn$linear) )

# plot results with 95% Bayesian confidence intervals (link scale)
par(mfrow=c(1,2))
plot(newdata$x,ycl$linear,type="l",main="Linear effect")
lines(newdata$x,ycl$linear+qnorm(.975)*ycl$se.lp,lty=3)
lines(newdata$x,ycl$linear-qnorm(.975)*ycl$se.lp,lty=3)
plot(newdata$x,ycn$linear,type="l",main="Nonlinear effect")
lines(newdata$x,ycn$linear+qnorm(.975)*ycn$se.lp,lty=3)
lines(newdata$x,ycn$linear-qnorm(.975)*ycn$se.lp,lty=3)
         
# plot results with 95% Bayesian confidence intervals (data scale)
par(mfrow=c(1,2))
plot(newdata$x,ycl$fitted,type="l",main="Linear effect")
lines(newdata$x,exp(ycl$linear+qnorm(.975)*ycl$se.lp),lty=3)
lines(newdata$x,exp(ycl$linear-qnorm(.975)*ycl$se.lp),lty=3)
plot(newdata$x,ycn$fitted,type="l",main="Nonlinear effect")
lines(newdata$x,exp(ycn$linear+qnorm(.975)*ycn$se.lp),lty=3)
lines(newdata$x,exp(ycn$linear-qnorm(.975)*ycn$se.lp),lty=3)

         
         
##########   EXAMPLE 2   ##########

# define bivariate function and data
set.seed(1)
myfun <- function(x1v,x2v){
  sin(2*pi*x1v) + log(x2v+.1) + cos(pi*(x1v-x2v))
}
ndpts <- 1000
x1v <- runif(ndpts)
x2v <- runif(ndpts)

# binomial response (with weights)
set.seed(773)
lp <- myfun(x1v,x2v)
p <- 1/(1+exp(-lp))
w <- sample(c(10,20,30,40,50),length(p),replace=TRUE)
y <- rbinom(n=ndpts,size=w,p=p)/w   ## y is proportion correct
cubmod <- bigssg(y~x1v*x2v,family="binomial",type=list(x1v="cub",x2v="cub"),nknots=100,weights=w)
crossprod( lp - cubmod$linear.predictor )/length(lp)

# define new data for prediction
xnew <- as.matrix(expand.grid(seq(0,1,length=50),seq(0,1,length=50)))
newdata <- list(x1v=xnew[,1],x2v=xnew[,2])

# get fitted values for new data
yp <- predict(cubmod,newdata)

# plot linear predictor and fitted values
par(mfrow=c(2,2))
imagebar(seq(0,1,l=50),seq(0,1,l=50),matrix(myfun(newdata$x1v,newdata$x2v),50,50),
         xlab=expression(italic(x)[1]),ylab=expression(italic(x)[2]),
         zlab=expression(hat(italic(y))),zlim=c(-4.5,1.5),main="True Linear Predictor")
imagebar(seq(0,1,l=50),seq(0,1,l=50),matrix(yp$linear.predictor,50,50),
         xlab=expression(italic(x)[1]),ylab=expression(italic(x)[2]),
         zlab=expression(hat(italic(y))),zlim=c(-4.5,1.5),main="Estimated Linear Predictor")
newprob <- 1/(1+exp(-myfun(newdata$x1v,newdata$x2v)))
imagebar(seq(0,1,l=50),seq(0,1,l=50),matrix(newprob,50,50),
         xlab=expression(italic(x)[1]),ylab=expression(italic(x)[2]),
         zlab=expression(hat(italic(y))),zlim=c(0,0.8),main="True Probabilities")
imagebar(seq(0,1,l=50),seq(0,1,l=50),matrix(yp$fitted.values,50,50),
         xlab=expression(italic(x)[1]),ylab=expression(italic(x)[2]),
         zlab=expression(hat(italic(y))),zlim=c(0,0.8),main="Estimated Probabilities")         

# predict linear and nonlinear effects for x1v (link scale)
newdata <- list(x1v=seq(0,1,length.out=100))
yl <- predict(cubmod,newdata,include="x1v",effect="lin",se.lp=TRUE)
yn <- predict(cubmod,newdata,include="x1v",effect="non",se.lp=TRUE)

# plot results with 95% Bayesian confidence intervals (link scale)
par(mfrow=c(1,2))
plot(newdata$x1v,yl$linear,type="l",main="Linear effect")
lines(newdata$x1v,yl$linear+qnorm(.975)*yl$se.lp,lty=3)
lines(newdata$x1v,yl$linear-qnorm(.975)*yl$se.lp,lty=3)
plot(newdata$x1v,yn$linear,type="l",main="Nonlinear effect")
lines(newdata$x1v,yn$linear+qnorm(.975)*yn$se.lp,lty=3)
lines(newdata$x1v,yn$linear-qnorm(.975)*yn$se.lp,lty=3)




