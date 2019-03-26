library(mgcv)


### Name: smooth.construct.bs.smooth.spec
### Title: Penalized B-splines in GAMs
### Aliases: smooth.construct.bs.smooth.spec Predict.matrix.Bspline.smooth
###   b.spline
### Keywords: models regression

### ** Examples

  require(mgcv)
  set.seed(5)
  dat <- gamSim(1,n=400,dist="normal",scale=2)
  bs <- "bs"
  ## note the double penalty on the s(x2) term...
  b <- gam(y~s(x0,bs=bs,m=c(4,2))+s(x1,bs=bs)+s(x2,k=15,bs=bs,m=c(4,3,0))+
           s(x3,bs=bs,m=c(1,0)),data=dat,method="REML")
  plot(b,pages=1)

  ## Extrapolation example, illustrating the importance of considering
  ## the penalty carefully if extrapolating...
  f3 <- function(x) 0.2 * x^11 * (10 * (1 - x))^6 + 10 * (10 * x)^3 * 
              (1 - x)^10 ## test function
  n <- 100;x <- runif(n)
  y <- f3(x) + rnorm(n)*2
  ## first a model with first order penalty over whole real line (red)
  b0 <- gam(y~s(x,m=1,k=20),method="ML")
  ## now a model with first order penalty evaluated over (-.5,1.5) (black)
  op <- options(warn=-1)
  b <- gam(y~s(x,bs="bs",m=c(3,1),k=20),knots=list(x=c(-.5,0,1,1.5)),
           method="ML")
  options(op)
  ## and the equivalent with same penalty over data range only (blue)
  b1 <- gam(y~s(x,bs="bs",m=c(3,1),k=20),method="ML")
  pd <- data.frame(x=seq(-.7,1.7,length=200))
  fv <- predict(b,pd,se=TRUE)
  ul <- fv$fit + fv$se.fit*2; ll <- fv$fit - fv$se.fit*2
  plot(x,y,xlim=c(-.7,1.7),ylim=range(c(y,ll,ul)),main=
  "1st order penalties: red tps; blue bs over (0,1); black bs over (-.5,1.5)")
  ## penalty defined on (-.5,1.5) gives plausible predictions and intervals
  ## over this range...
  lines(pd$x,fv$fit);lines(pd$x,ul,lty=2);lines(pd$x,ll,lty=2)
  fv <- predict(b0,pd,se=TRUE)
  ul <- fv$fit + fv$se.fit*2; ll <- fv$fit - fv$se.fit*2
  ## penalty defined on whole real line gives constant width intervals away
  ## from data, as slope there must be zero, to avoid infinite penalty:
  lines(pd$x,fv$fit,col=2)
  lines(pd$x,ul,lty=2,col=2);lines(pd$x,ll,lty=2,col=2)
  fv <- predict(b1,pd,se=TRUE)
  ul <- fv$fit + fv$se.fit*2; ll <- fv$fit - fv$se.fit*2
  ## penalty defined only over the data interval (0,1) gives wild and wide
  ## extrapolation since penalty has been `turned off' outside data range:
  lines(pd$x,fv$fit,col=4)
  lines(pd$x,ul,lty=2,col=4);lines(pd$x,ll,lty=2,col=4)

  ## construct smooth of x. Model matrix sm$X and penalty 
  ## matrix sm$S[[1]] will have many zero entries...
  x <- seq(0,1,length=100)
  sm <- smoothCon(s(x,bs="bs"),data.frame(x))[[1]]

  ## another example checking penalty numerically...
  m <- c(4,2); k <- 15; b <- runif(k)
  sm <- smoothCon(s(x,bs="bs",m=m,k=k),data.frame(x),
                  scale.penalty=FALSE)[[1]]
  sm$deriv <- m[2]
  h0 <- 1e-3; xk <- sm$knots[(m[1]+1):(k+1)]
  Xp <- PredictMat(sm,data.frame(x=seq(xk[1]+h0/2,max(xk)-h0/2,h0)))
  sum((Xp%*%b)^2*h0) ## numerical approximation to penalty
  b%*%sm$S[[1]]%*%b  ## `exact' version

  ## ...repeated with uneven knot spacing...
  m <- c(4,2); k <- 15; b <- runif(k)
  ## produce the required 20 unevenly spaced knots...
  knots <- data.frame(x=c(-.4,-.3,-.2,-.1,-.001,.05,.15,
        .21,.3,.32,.4,.6,.65,.75,.9,1.001,1.1,1.2,1.3,1.4))
  sm <- smoothCon(s(x,bs="bs",m=m,k=k),data.frame(x),
        knots=knots,scale.penalty=FALSE)[[1]]
  sm$deriv <- m[2]
  h0 <- 1e-3; xk <- sm$knots[(m[1]+1):(k+1)]
  Xp <- PredictMat(sm,data.frame(x=seq(xk[1]+h0/2,max(xk)-h0/2,h0)))
  sum((Xp%*%b)^2*h0) ## numerical approximation to penalty
  b%*%sm$S[[1]]%*%b  ## `exact' version




