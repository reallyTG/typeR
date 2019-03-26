library(gamair)


### Name: ch4.solutions
### Title: Solution code for Chapter 4: Introducing GAMs
### Aliases: ch4.solutions

### ** Examples

library(gamair); library(mgcv)
## Q.1
set.seed(1)
x <- sort(runif(40)*10)^.5
y <- sort(runif(40))^0.1
## polynomial fits ...
xx <- seq(min(x),max(x),length=200)
plot(x,y)
b<-lm(y~poly(x,5))
lines(xx,predict(b,data.frame(x=xx)))
b<-lm(y~poly(x,10))
lines(xx,predict(b,data.frame(x=xx)),col=2)
## spline fits ...
sb <- function(x,xk) { abs(x-xk)^3}
q<-11
xk<-((1:(q-2)/(q-1))*10)^.5
## lazy person's formula construction ...
form<-paste("sb(x,xk[",1:(q-2),"])",sep="",collapse="+")
form <- paste("y~x+",form)
b<-lm(formula(form))
lines(xx,predict(b,data.frame(x=xx)),col=3)

## Q.2
## x,y, and xx from previous question
b1 <- lm(form)
plot(x,y)
lines(xx,predict(b1,data.frame(x=xx)),col=4)
X <- model.matrix(b1)   # extract model matrix
beta <- solve(t(X)%*%X,t(X)%*%y,tol=0)
b1$coefficients <- beta # trick for simple prediction
lines(xx,predict(b1,data.frame(x=xx)),col=5)
## ... upping the basis dimension to 11 makes the
## normal equations estimates perform very badly.

## Q.8 Additive model as a mixed model

## from 4.2.1 and 4.3.1...
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

tf.XD <- function(x,xk,cmx=NULL,m=2) {
## get X and D subject to constraint
  nk <- length(xk)
  X <- tf.X(x,xk)[,-nk]                   ## basis matrix
  D <- diff(diag(nk),differences=m)[,-nk] ## root penalty
  if (is.null(cmx)) cmx <- colMeans(X)
  X <- sweep(X,2,cmx)        ## subtract cmx from columns
  list(X=X,D=D,cmx=cmx)
} ## tf.XD

## Solution code...
## a)

XZmixed <- function(x,xk=NULL,k=10,sep=TRUE) {
## Get re-parameterized model matrix/matrices...
  if (is.null(xk)) xk <- seq(min(x),max(x),length=k)
  xd <- tf.XD(x,xk)
  D <- rbind(0,xd$D); D[1,1] <- 1
  X <- t(solve(t(D),t(xd$X)))
  if (sep) list(X=X[,1,drop=FALSE],Z=X[,-1],xk=xk)
  else list(X=X,xk=xk) 
} ## XZmixed

## b)
## get components of smooths for Height and Girth...
xh <- XZmixed(trees$Height)
xg <- XZmixed(trees$Girth)

## Fit as mixed model...
X <- cbind(1,xh$X,xg$X)
Zg <- xg$Z; Zh <- xh$Z
g1 <- g <- factor(rep(1,nrow(X)))
vol <- trees$Volume
b <- lme(vol~X-1,random=list(g=pdIdent(~Zh-1),
         g1=pdIdent(~Zg-1)))

## c)
## raw vs. fitted and residual plot 
par(mfrow=c(1,2))
plot(fitted(b),vol)
rsd <- vol - fitted(b)
plot(fitted(b),rsd)

## extract coefs for each smooth...
bh <- as.numeric(coef(b)[c(2,4:11)]) ## coefs for s(Height)
bg <- as.numeric(coef(b)[c(3,12:19)]) ## coefs for s(Height)

## get smooth specific prediction matrices...
Xh <- XZmixed(trees$Height,xk=xh$xk,sep=FALSE)$X
Xg <- XZmixed(trees$Girth,xk=xg$xk,sep=FALSE)$X

## d)
## plot smooths over partial residuals... 
sh <- Xh%*%bh
sg <- Xg%*%bg

par(mfrow=c(1,2))
plot(trees$Girth,sg+rsd,pch=19,col="grey",
     xlab="Girth",ylab="s(Girth)")
lines(trees$Girth,sg)
plot(trees$Height,sh+rsd,pch=19,col="grey",
     xlab="Height",ylab="s(Height)")
lines(trees$Height,sh)

## Q.9 Generalized version of 8 by PQL
## a)

gamm.fit <- function(y,X,Zh,Zg) {
## gamma error log link 2 term gam fit via PQL...
  eta <- log(y) ## get initial eta
  g <- g1 <- factor(rep(1,nrow(X)))
  not.converged <- TRUE
  old.reml <- 1e100 ## don't converge immediately
  while (not.converged) {
    mu <- exp(eta)  ## current mu estimate  
    z <- (y - mu)/mu + eta ## pseudodata
    fit <- lme(z~X-1,random=list(g=pdIdent(~Zh-1),g1=pdIdent(~Zg-1)))
    if (abs(logLik(fit)-old.reml)<1e-5*abs(logLik(fit))) { 
      not.converged <- FALSE
    }
    old.reml <- logLik(fit) 
    eta <- fitted(fit) ## updated eta
  }
  fit
} ## gamm.fit

## b) re-using arguments from Q.8...
m <- gamm.fit(vol,X,Zh,Zg)

## c)
rsd <- residuals(m)
par(mfrow=c(1,2))
plot(exp(fitted(m)),vol);abline(0,1)
plot(fitted(m),rsd)

## d)
bh <- as.numeric(coef(m)[c(2,4:11)]) ## coefs for s(Height)
bg <- as.numeric(coef(m)[c(3,12:19)]) ## coefs for s(Height)

sh <- Xh%*%bh
sg <- Xg%*%bg

par(mfrow=c(1,2))
plot(trees$Girth,sg+rsd,pch=19,col="grey",
     xlab="Girth",ylab="s(Girth)")
lines(trees$Girth,sg)
plot(trees$Height,sh+rsd,pch=19,col="grey",
     xlab="Height",ylab="s(Height)")
lines(trees$Height,sh)





