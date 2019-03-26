library(gamair)


### Name: ch6.solutions
### Title: Solution code for Chapter 6: GAM Theory
### Aliases: ch6.solutions

### ** Examples

library(gamair); library(mgcv)

## code from Chapter 5 solutions...

## Q.3

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

## a) and b)
fit.wPs <- function(y,X,B,lambda=0,w=rep(1,length(y)))
# fit to y by weighted penalized least squares, X is
# model matrix, B is sqrt penalty, lambda is smoothing p.
{ w <- as.numeric(w^.5)
  n <- nrow(X)
  X<-rbind(w*X,sqrt(lambda)*B)
  y<-c(w*y,rep(0,nrow(B)))
  b <- lm(y~X-1) # actually estimate model
  trA <- sum(influence(b)$hat[1:n])
  rss <- sum((y-fitted(b))[1:n]^2) ## not really needed here
  list(trA=trA,rss=rss,b=coef(b))
}

fitPoiPs <- function(y,X,B,lambda=0)
# Fit Poisson model with log-link by P-IRLS
{ mu <- y;mu[mu==0] <- .1
  eta <- log(mu)
  converged <- FALSE
  dev <- ll.sat <- sum(dpois(y,y,log=TRUE))
  while (!converged) {
    z <- (y-mu)/mu + eta
    w <- mu
    fPs <- fit.wPs(z,X,B,lambda,w)
    eta <- X%*%fPs$b
    mu=exp(eta)
    old.dev <- dev
    dev <- 2*(ll.sat-sum(dpois(y,mu,log=TRUE)))
    if (abs(dev-old.dev)<1e-6*dev) converged <- TRUE
  }
  list(dev=dev,rss=fPs$rss,trA=fPs$trA,b=fPs$b,fv=mu)
}

## c)
## simulate data as in question...
set.seed(1)
f <- function(x) .04*x^11*(10*(1-x))^6+2*(10*x)^3*(1-x)^10
n <- 100;x <- sort(runif(n))
y <- rpois(rep(1,n),exp(f(x)))

## fitting...
library(splines)
ps <- pspline.XB(x,q=10,m=2,p.m=2)
lambda <- 1e-4;reps <- 60
sp <- trA <- gcv <- rep(0,reps)
for (i in 1:reps) { # loop through trial s.p.s
  fps <- fitPoiPs(y,ps$X,ps$B,lambda=lambda)
  trA[i] <- fps$trA;sp[i] <- lambda
  gcv[i] <- n*fps$dev/(n-trA[i])^2
  lambda <- lambda*1.3
}
plot(trA,gcv,type="l")
fps1 <- fitPoiPs(y,ps$X,ps$B,lambda=sp[gcv==min(gcv)])
plot(x,y);lines(x,fps1$fv)

## Q.6 Fellner-Schall for GCV and AIC...

## b)
library(mgcv);library(MASS)
sm <- smoothCon(s(times,k=20),data=mcycle)[[1]]
X <- sm$X; S <- sm$S[[1]]; y <- mcycle$accel
lambda <- 1; n <- length(y)
XX <- crossprod(X);
with(mcycle,plot(times,accel))
for (i in 1:20) {
  R <- chol(XX+lambda*S)
  b <- backsolve(R,forwardsolve(t(R),t(X) %*% y))
  f <- X %*% b
  lines(mcycle$times,f,col="grey")
  HiS <- backsolve(R,forwardsolve(t(R),S))
  HiH <- backsolve(R,forwardsolve(t(R),XX))
  tau <- sum(diag(HiH))
  if (i>1) { ## convergence test
    if (abs(tau-tau0)<1e-5*tau) break  
  } 
  tau0 <- tau
  dt.dl <- -sum(t(HiH)*HiS)
  db.dl <- -HiS %*% b
  dD.db <- 2*t(X) %*% (f - y)
  lambda <- -sum(2*(y-f)^2)/(n-tau)*dt.dl/sum(db.dl*dD.db) * lambda
}
lines(mcycle$times,f)

## c)
y <- c(12,14,33,50,67,74,123,141,165,204,253,246,240)
t <- 1:13
sm <- smoothCon(s(t),data=data.frame(t=t,y=y))[[1]]
X <- sm$X; S <- sm$S[[1]]; lambda <- .001; n <- length(y)
plot(t,y)
mu <- y; eta <- log(mu)
for (i in 1:50) {
  w <- mu; z <- (y-mu)/mu + eta
  XWX <- crossprod(sqrt(w)*X)
  R <- chol(XWX+lambda*S)
  b <- backsolve(R,forwardsolve(t(R),t(X) %*% (w*z)))
  eta <- drop(X %*% b);mu <- exp(eta)
  lines(t,mu,col="grey")
  HiS <- backsolve(R,forwardsolve(t(R),S))
  HiH <- backsolve(R,forwardsolve(t(R),XWX))
  tau <- sum(diag(HiH))
  if (i>1) { ## convergence test
    if (abs(tau-tau0)<1e-5*tau) break  
  } 
  tau0 <- tau
  dt.dl <- -sum(t(HiH)*HiS)
  db.dl <- -HiS %*% b
  dl.db <- t(X) %*% (y-mu) ## especially simple for this case
  lambda <- dt.dl/sum(db.dl*dl.db) * lambda
}
i;tau;lines(t,mu)

## Q.8 log det stabilty (or lack of)

set.seed(1);lam <- 1
A1 <- crossprod(diff(diag(3),diff=1))
A2 <- crossprod(matrix(runif(9),3,3))
A <- matrix(0,5,5);A[1:3,1:3] <- A1
A[3:5,3:5] <- A[3:5,3:5] + lam * A2

ldetA.qr <- ldetA.ev <- ldetA.svd <- ldetA <-
            rho <- seq(-40,-25,length=100)
for (i in 1:length(rho)) {
  lam <- exp(rho[i])
  A <- matrix(0,5,5);A[1:3,1:3] <- A1
  A[3:5,3:5] <- A[3:5,3:5] + lam * A2
  ea1 <- eigen(A1)
  Q <- diag(5);Q[1:3,1:3] <- ea1$vectors
  At <- matrix(0,5,5)
  At[3:5,3:5] <- At[3:5,3:5] + lam * A2
  At <- t(Q)%*%At%*%Q
  diag(At)[1:2] <- diag(At)[1:2]+ea1$values[1:2]

  ldetA[i] <- sum(log(abs(diag(qr.R(qr(At))))))
  ldetA.qr[i] <- sum(log(abs(diag(qr.R(qr(A))))))
  ldetA.ev[i] <- sum(log(abs(eigen(A)$values))) 
  ldetA.svd[i] <- sum(log(abs(svd(A)$d)))
}
plot(rho,ldetA,type="l") ## nice and stable
## not...
lines(rho,ldetA.qr,lty=2)
lines(rho,ldetA.ev,lty=3)
lines(rho,ldetA.svd,lty=4)






