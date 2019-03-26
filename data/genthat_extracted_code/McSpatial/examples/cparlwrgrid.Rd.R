library(McSpatial)


### Name: cparlwrgrid
### Title: Conditionally parametric LWR regression bandwidth or window
###   selection
### Aliases: cparlwrgrid
### Keywords: Conditionally Parametric Nonparametric Locally Weighted
###   Regression

### ** Examples

par(ask=TRUE)
n = 1000
z1 <- runif(n,0,2*pi)
z1 <- sort(z1)
z2 <- runif(n,0,2*pi)
o1 <- order(z1)
o2 <- order(z2)
ybase1 <-  z1 - .1*(z1^2) + sin(z1) - cos(z1) - .5*sin(2*z1) + .5*cos(2*z1) 
ybase2 <- -z2 + .1*(z2^2) - sin(z2) + cos(z2) + .5*sin(2*z2) - .5*cos(2*z2)
ybase <- ybase1+ybase2
sig = sd(ybase)/2
y <- ybase + rnorm(n,0,sig)
summary(lm(y~ybase))

# Single variable estimation
fit1 <- cparlwrgrid(y~z1,nonpar=~z1,window=seq(.10,.40,.10))
c(fit1$df1,fit1$df2,2*fit1$df1-fit1$df2)
plot(z1[o1],ybase1[o1],type="l",ylim=c(min(ybase1,fit1$yhat),max(ybase1,fit1$yhat)),
  xlab="z1",ylab="y")
# Make predicted and actual values have the same means
fit1$yhat <- fit1$yhat - mean(fit1$yhat) + mean(ybase1)
lines(z1[o1],fit1$yhat[o1], col="red")
legend("topright", c("Base", "LWR"), col=c("black","red"),lwd=1)
fit2 <- cparlwrgrid(y~z2,nonpar=~z2,window=seq(.10,.40,.10))
fit2$yhat <- fit2$yhat - mean(fit2$yhat) + mean(ybase2)
c(fit2$df1,fit2$df2,2*fit2$df1-fit2$df2)
plot(z2[o2],ybase2[o2],type="l",ylim=c(min(ybase2,fit2$yhat),max(ybase2,fit2$yhat)),
    xlab="z1",ylab="y")
lines(z2[o2],fit2$yhat[o2], col="red")
legend("topright", c("Base", "LWR"), col=c("black","red"),lwd=1)

#both variables
fit3 <- cparlwrgrid(y~z1+z2,nonpar=~z1+z2,window=seq(.10,.20,.05))
yhat1 <- fit3$yhat - mean(fit3$yhat) + mean(ybase1)
plot(z1[o1],yhat1[o1], xlab="z1",ylab="y")
lines(z1[o1],ybase1[o1],col="red")
yhat2 <- fit3$yhat - mean(fit3$yhat) + mean(ybase2)
plot(z2[o2],yhat2[o2], xlab="z2",ylab="y")
lines(z2[o2],ybase2[o2],col="red")



