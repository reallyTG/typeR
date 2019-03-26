library(gamair)


### Name: ch5.solutions
### Title: Solution code for Chapter 5: Smoothers
### Aliases: ch5.solutions

### ** Examples

library(gamair); library(mgcv)
## Q.4 P-spline
## a)
library(splines)
pspline.XB <- function(x,q=10,m=2,p.m=2)
# Get model matrix and sqrt Penalty matrix for P-spline
{ # first make knot sequence, k
  k <- seq(min(x),max(x),length=q-m)
  dk <- k[2]-k[1]
  k <- c(k[1]-dk*((m+1):1),k,k[q-m]+dk*(1:(m+1)))
  # now get model matrix and root penalty
  X <- splineDesign(k,x,ord=m+2)
  B <- diff(diag(q),difference=p.m)
  list(X=X,B=B)
} ## pspline.XB

## b)
n<-100
x <- sort(runif(n))
ps <- pspline.XB(x,q=9,m=2,p.m=2)
par(mfrow=c(3,3)) # plot the original basis functions
for (i in 1:9) plot(x,ps$X[,i],type="l")

## c)
S <-  t(ps$B)%*%ps$B
es <- eigen(S);U <- es$vectors
XU <- ps$X%*%U # last p.m cols are penalty null space
par(mfrow=c(3,3)) # plot penalty eigenbasis functions
for (i in 1:9) plot(x,XU[,i],type="l")

## d)
qrx <- qr(ps$X) # QR of X
R <- qr.R(qrx)
RSR <- solve(t(R),S);RSR <- t(solve(t(R),t(RSR)))
ersr <- eigen(RSR)
U <- ersr$vectors
Q <- qr.Q(qrx)
QU <- Q%*%U
par(mfrow=c(3,3)) # plot the natural basis functions
for (i in 1:9) plot(x,QU[,i],type="l")

## Q.5

test1<-function(x,z,sx=0.3,sz=0.4)
{ 1.2*exp(-(x-0.2)^2/sx^2-(z-0.3)^2/sz^2)+
  0.8*exp(-(x-0.7)^2/sx^2-(z-0.8)^2/sz^2)
}
n <- 200
x <- matrix(runif(2*n),n,2)
f <- test1(x[,1],x[,2])
y <- f + rnorm(n)*.1

eta <- function(r)
{ # thin plate spline basis functions
  ind <- r<=0
  eta <- r
  eta[!ind] <- r[!ind]^2*log(r[!ind])/(8*pi)
  eta[ind] <- 0
  eta
} ## eta

XSC <- function(x,xk=x)
{ # set up t.p.s., given covariates, x, and knots, xk
  n <- nrow(x);k <- nrow(xk)
  X <- matrix(1,n,k+3)  # tps model matrix
  for (j in 1:k) {
    r <- sqrt((x[,1]-xk[j,1])^2+(x[,2]-xk[j,2])^2)
    X[,j] <- eta(r)
  }
  X[,j+2] <- x[,1];X[,j+3] <- x[,2]
  C <- matrix(0,3,k+3)  # tps constraint matrix
  S <- matrix(0,k+3,k+3)# tps penalty matrix
  for (i in 1:k) {
   C[1,i]<-1;C[2,i] <- xk[i,1];C[3,i] <- xk[i,2]
   for (j in i:k) S[j,i]<-S[i,j] <-
                eta(sqrt(sum((xk[i,]-xk[j,])^2)))
  }
  list(X=X,S=S,C=C)
} ## XSC

absorb.con <- function(X,S,C)
{ # get constraint null space, Z...
  qrc <- qr(t(C)) # QR=C', Q=[Y,Z]
  m <- nrow(C);k <- ncol(X)
  X <- t(qr.qty(qrc,t(X)))[,(m+1):k] # form XZ
  # now form Z'SZ ...
  S <- qr.qty(qrc,t(qr.qty(qrc,t(S))))[(m+1):k,(m+1):k]
  list(X=X,S=S,qrc=qrc)
} ## absorb.con

fit.tps <- function(y,x,xk=x,lambda=0)
{ tp <- XSC(x,xk)                  # get tps matrices
  tp <- absorb.con(tp$X,tp$S,tp$C) # make unconstrained
  ev <- eigen(tp$S,symmetric=TRUE) # get sqrt penalty, rS
  rS <- ev$vectors%*%(ev$values^.5*t(ev$vectors))
  X <- rbind(tp$X,rS*sqrt(lambda)) # augmented model matrix
  z <- c(y,rep(0,ncol(rS)))        # augmented data
  beta <- coef(lm(z~X-1))          # fit model
  beta <- qr.qy(tp$qrc,c(0,0,0,beta)) # backtransform beta
} ## fit.tps

eval.tps <- function(x,beta,xk)
{ # evaluate tps at x, given parameters, beta, and knots, xk.
  k <- nrow(xk);n <- nrow(x)
  f <- rep(beta[k+1],n)
  for (i in 1:k) {
    r <- sqrt((x[,1]-xk[i,1])^2+(x[,2]-xk[i,2])^2)
    f <- f + beta[i]*eta(r)
  }
  f <- f + beta[k+2]*x[,1] + beta[k+3]*x[,2]
} ## eval.tps

## select some `knots', xk ...
ind <- sample(1:n,100,replace=FALSE)
xk <- x[ind,]
## fit model ...
beta <- fit.tps(y,x,xk=xk,lambda=.01)

## contour truth and fit
par(mfrow=c(1,2))
xp <- matrix(0,900,2)
x1<-seq(0,1,length=30);x2<-seq(0,1,length=30)
xp[,1]<-rep(x1,30);xp[,2]<-rep(x2,rep(30,30))
truth<-matrix(test1(xp[,1],xp[,2]),30,30)
contour(x1,x2,truth)
fit <- matrix(eval.tps(xp,beta,xk),30,30)
contour(x1,x2,fit)

## Q.6 smooth.construct

tf <- function(x,xj,j) {
## generate jth tent function from set defined by knots xj
  dj <- xj*0;dj[j] <- 1
  approx(xj,dj,x)$y
}

tf.X <- function(x,xj) {
## tent function basis matrix given data x
## and knot sequence xj
  nk <- length(xj); n <- length(x)
  X <- matrix(NA,n,nk)
  for (j in 1:nk) X[,j] <- tf(x,xj,j)
  X
}

smooth.construct.pl.smooth.spec<-function(object,data,knots) {
## a piecewise linear smooth constructor method function
  m <- object$p.order[1]
  if (is.na(m)) m <- 2 ## default 
  if (m<1) stop("silly m supplied")
  if (object$bs.dim<0) object$bs.dim <- 20 ## default
  x <- data[[object$term]]  ## the data
  k <- knots[[object$term]] ## will be NULL if none supplied
  if (is.null(k)) { # space knots through data
    k <- seq(min(x),max(x),length=object$bs.dim)
  } else {
    if (length(k)!=object$bs.dim) # right number of knots?
    k <- seq(min(k),max(k),length=object$bs.dim)
  }
  object$X <- tf.X(x,k)
  if (!object$fixed) { # create the penalty matrix 
    object$S[[1]] <- crossprod(diff(diag(object$bs.dim),difference=m))
  }
  object$rank <- object$bs.dim - m  # penalty rank
  object$null.space.dim <- m  # dim. of unpenalized space
  ## store "tr" specific stuff ...
  object$knots <- k
 
  object$df <- ncol(object$X)     # maximum DoF (if unconstrained)
 
  class(object) <- "pl.smooth"  # Give object a class
  object
}

Predict.matrix.pl.smooth<-function(object,data)
## prediction method function for the `pl' smooth class
{ x <- data[[object$term]]
  X <- tf.X(x,object$knots)
  X # return the prediction matrix
}

# an example, using the new class....
require(mgcv)
set.seed(10)
dat <- gamSim(1,n=400,scale=2)
b <- gam(y~s(x0,bs="pl",m=2)+s(x1,bs="pl",m=2) +
         s(x2,bs="pl",m=3)+s(x3,bs="pl",m=2),
	 data=dat,method="REML")
plot(b,pages=1)





