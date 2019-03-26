library(McSpatial)


### Name: repsalefourier
### Title: Repeat Sales Estimation using Fourier Expansions
### Aliases: repsalefourier
### Keywords: Repeat Sales Series Expansions

### ** Examples

set.seed(189)
n = 2000
# sale dates range from 0-50
# drawn uniformly from all possible time0, time1 combinations with time0<time1
tmat <- expand.grid(seq(0,50), seq(0,50))
tmat <- tmat[tmat[,1]<tmat[,2], ]
tobs <- sample(seq(1:nrow(tmat)),n,replace=TRUE)
time0 <- tmat[tobs,1]
time1 <- tmat[tobs,2]
timesale <- time1-time0
timesale2 <- timesale^2

par(ask=TRUE)
z0 <- 2*pi*time0/50
z0sq <- z0^2
sin0 <- sin(z0)
cos0 <- cos(z0)
z1 <- 2*pi*time1/50
z1sq <- z1^2
sin1 <- sin(z1)
cos1 <- cos(z1)
ybase0 <- z0 + .05*z0sq -.5*sin0 - .5*cos0
miny <- min(ybase0)
ybase0 <- ybase0-miny
ybase1 <- z1 + .05*z1sq -.5*sin1 - .5*cos1 - miny
maxy <- max(ybase1)
ybase0 <- ybase0/maxy
ybase1 <- ybase1/maxy
summary(data.frame(ybase0,ybase1))
sig1 = sd(c(ybase0,ybase1))/2
y0 <- ybase0 + rnorm(n,0,sig1)
y1 <- ybase1 + rnorm(n,0,sig1)
fit <- lm(y0~z0+z0sq+sin0+cos0)
summary(fit)
plot(time0,fitted(fit))
fit <- lm(y1~z1+z1sq+sin1+cos1)
summary(fit)
plot(time1,fitted(fit))

fit1 <- repsale(price1=y1,price0=y0,time1=time1,time0=time0,graph=FALSE,
  mergefirst=5)
fit2 <- repsalefourier(price1=y1,price0=y0,time1=time1,time0=time0,q=1,
  graph=FALSE,mergefirst=5)
timevar <- seq(0,50)
plot(timevar,fit1$pindex,type="l",xlab="Time",ylab="Index",
  ylim=c(min(fit1$pindex),max(fit2$pindex)))
lines(timevar,fit2$pindex)



# variance rises with timesale
# var(u0) = sig1^2; var(u1) = (sig1 + timesale/50)^2
# var(u1-u0) = var(u0) + var(u1) = 2*(sig1^2) + 2*sig1*timesale/10 + (timesale^2)/2500
y0 <- ybase0 + rnorm(n,0,sig1)
y1 <- ybase1 + rnorm(n,0,sig1+timesale/50)
par(ask=TRUE)
fit1 <- repsalefourier(price0=y0, price1=y1, time0=time0, time1=time1,
  graph=FALSE)
fit2 <- repsalefourier(price0=y0, price1=y1, time0=time0, time1=time1,
  graph=FALSE,stage3="abs",stage3_xlist=~timesale+timesale2)
plot(timevar,fit1$lo,type="l",xlab="Time",ylab="Index",
  ylim=c(min(fit1$lo,fit2$lo),max(fit1$hi,fit2$hi)))
lines(timevar,fit1$hi)
lines(timevar,fit2$lo,col="red")
lines(timevar,fit2$hi,col="red")




