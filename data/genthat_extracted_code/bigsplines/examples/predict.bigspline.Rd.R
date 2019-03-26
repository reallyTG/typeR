library(bigsplines)


### Name: predict.bigspline
### Title: Predicts for "bigspline" Objects
### Aliases: predict.bigspline

### ** Examples


##########   EXAMPLE 1   ##########

# define univariate function and data
set.seed(773)
myfun <- function(x){ 2 + x + sin(2*pi*x) }
x <- runif(10^4)
y <- myfun(x) + rnorm(10^4)

# fit cubic spline model
cubmod <- bigspline(x,y)
crossprod( predict(cubmod) - myfun(x) )/10^4

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

# define (same) univariate function and data
set.seed(773)
myfun <- function(x){ 2 + x + sin(2*pi*x) }
x <- runif(10^4)
y <- myfun(x) + rnorm(10^4)

# fit a different cubic spline model
cubamod <- bigspline(x,y,type="cub0")
crossprod( predict(cubamod) - myfun(x) )/10^4

# define (same) new data for prediction
newdata <- data.frame(x=seq(0,1,length.out=100))

# get fitted values and standard errors for new data
ya <- predict(cubamod,newdata,se.fit=TRUE)

# plot results with 95% Bayesian confidence interval
plot(newdata$x,ya$fit,type="l")
lines(newdata$x,ya$fit+qnorm(.975)*ya$se.fit,lty=3)
lines(newdata$x,ya$fit-qnorm(.975)*ya$se.fit,lty=3)

# predict constant, linear, and nonlinear effects
ya0 <- predict(cubamod,newdata,se.fit=TRUE,effect="0")
yal <- predict(cubamod,newdata,se.fit=TRUE,effect="lin")
yan <- predict(cubamod,newdata,se.fit=TRUE,effect="non")
crossprod( ya$fit - (ya0$fit + yal$fit + yan$fit) )

# plot results with 95% Bayesian confidence intervals
par(mfrow=c(1,2))
plot(newdata$x,yal$fit,type="l",main="Linear effect")
lines(newdata$x,yal$fit+qnorm(.975)*yal$se.fit,lty=3)
lines(newdata$x,yal$fit-qnorm(.975)*yal$se.fit,lty=3)
plot(newdata$x,yan$fit,type="l",main="Nonlinear effect")
lines(newdata$x,yan$fit+qnorm(.975)*yan$se.fit,lty=3)
lines(newdata$x,yan$fit-qnorm(.975)*yan$se.fit,lty=3)




