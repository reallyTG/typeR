library(gamair)


### Name: ch5
### Title: Code for Chapter 5: Smoothers
### Aliases: ch5

### ** Examples

library(gamair); library(mgcv)

## 5.3.3 P-splines

bspline <- function(x,k,i,m=2)
# evaluate ith b-spline basis function of order m at the values
# in x, given knot locations in k
{ if (m==-1) # base of recursion
  { res <- as.numeric(x<k[i+1]&x>=k[i])
  } else     # construct from call to lower order basis
  { z0 <- (x-k[i])/(k[i+m+1]-k[i])
    z1 <- (k[i+m+2]-x)/(k[i+m+2]-k[i+1])
    res <- z0*bspline(x,k,i,m-1)+ z1*bspline(x,k,i+1,m-1)
  }
  res
} ## bspline

k<-6                              # example basis dimension
P <- diff(diag(k),differences=1)  # sqrt of penalty matrix
S <- t(P)%*%P 

## 5.3.6 SCOP-splines
x <- 0:200/200
set.seed(32)
y <- binomial()$linkinv((x-.5)*10) + rnorm(length(x))*.1
plot(x,y)
k <- 7
ssp <- s(x,bs="ps",k=k); ssp$mono <- 1
sm <- smoothCon(ssp,data.frame(x))[[1]]
X <- sm$X; XX <- crossprod(X); sp <- .005
gamma <- rep(0,k); S <- sm$S[[1]]
for (i in 1:20) {
  gt <- c(gamma[1],exp(gamma[2:k]))
  dg <- c(1,gt[2:k]) 
  g <- -dg*(t(X)%*%(y-X%*%gt)) + sp*S%*%gamma
  H <- dg*t(dg*XX)
  gamma <- gamma - solve(H+sp*S,g)
}
lines(x,X%*%gt)




