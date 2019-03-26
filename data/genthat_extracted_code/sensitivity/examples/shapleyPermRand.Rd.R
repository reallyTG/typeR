library(sensitivity)


### Name: shapleyPermRand
### Title: Estimation of Shapley effects by random permutations of inputs
###   (Agorithm of Song et al, 2016), in cases of independent or dependent
###   inputs
### Aliases: shapleyPermRand tell.shapleyPermRand print.shapleyPermRand
###   plot.shapleyPermRand
### Keywords: design

### ** Examples


## No test: 

##################################
# Test case : the Ishigami function
# See Iooss and Prieur (2017)

library(gtools)

d <- 3
Xall <- function(n) matrix(runif(d*n,-pi,pi),nc=d)
Xset <- function(n, Sj, Sjc, xjc) matrix(runif(n*length(Sj),-pi,pi),nc=length(Sj))

x <- shapleyPermRand(model = ishigami.fun, Xall=Xall, Xset=Xset, d=d, Nv=1e4, m=1e4, No = 1, Ni = 3)
print(x)
plot(x)

##################################
# Test case : Linear model (3 Gaussian inputs including 2 dependent)
# See Iooss and Prieur (2017)

library(gtools)
library(mvtnorm) # Multivariate Gaussian variables
library(condMVNorm) # Conditional multivariate Gaussian variables

modlin <- function(X) apply(X,1,sum)

d <- 3
mu <- rep(0,d)
sig <- c(1,1,2)
ro <- 0.9
Cormat <- matrix(c(1,0,0,0,1,ro,0,ro,1),d,d)
Covmat <- ( sig %*% t(sig) ) * Cormat

Xall <- function(n) mvtnorm::rmvnorm(n,mu,Covmat)

Xset <- function(n, Sj, Sjc, xjc){
  if (is.null(Sjc)){
    if (length(Sj) == 1){ rnorm(n,mu[Sj],sqrt(Covmat[Sj,Sj]))
    } else{ mvtnorm::rmvnorm(n,mu[Sj],Covmat[Sj,Sj])}
  } else{ condMVNorm::rcmvnorm(n, mu, Covmat, dependent.ind=Sj, given.ind=Sjc, X.given=xjc)}}

x <- shapleyPermRand(model = modlin, Xall=Xall, Xset=Xset, d=d, Nv=1e3, m = 1e4, No = 1, Ni = 3)
print(x)
plot(x)

#############################""
# Test case : Multiserver queue model (6 Pert inputs including two dependent pairs)
# See Song, Nelson and Staum (2016)
 
library(gtools)
library(mc2d) # To generate Pert random variables

d=6

model <-function(x)
{
  # x is a vector of six arrival rates 
  JL = cbind(x[,1], x[,1]*0.6 + (x[,4]+x[,6])*0.3, x[,1]*0.4 + x[,2]+x[,3]+x[,5], x[,4]+x[,6],
             (x[,1]*0.4 + x[,2]+x[,3]+x[,5])*0.5 
             + (x[,4]+x[,6])*0.7, (x[,1]*0.4 + x[,2]+x[,3]+x[,5])*0.5)
  mu = c(1.2, 1.5, 4, 1.8, 3.6, 1.5)
  
  rho = t(apply(JL,1,'/',mu))
  
  return(apply(cbind(rho,x), 1, function(y) sum(y[1:6]/(1-y[1:6]))/sum(y[7:12])*24))
}

Xall <- function(n)
{
  r1 = 0.5
  r2 = -0.5
  
  # x1 and x2 are correlated
  # convert to Pearson correlation
  r1 = 2 * sin(pi/6*r1)
  
  z1 = rnorm(n);
  z2 = r1 * z1 + sqrt(1-r1^2) * rnorm(n)
  
  x1 = qpert(pnorm(z1),0.5,0.6,0.8)
  x2 = qpert(pnorm(z2),0.5,0.6,0.8)
  
  # x3 and x4 are correlated
  # convert to Pearson correlation
  r2 = 2 * sin(pi/6*r2)
  
  z3 = rnorm(n);
  z4 = r2*z3 + sqrt(1-r2^2) * rnorm(n)
  
  x3 = qpert(pnorm(z3),0.5,0.6,0.8)
  x4 = qpert(pnorm(z4),0.5,0.6,0.8)
  
  cbind(x1,x2,x3,x4,x5=rpert(n,0.5,0.6,0.8),x6=rpert(n,0.5,0.6,0.8))
}

Xset <- function(n, Sj, Sjc, xjc)
{
  r1 = 0.5
  r2 = -0.5
  
  # generate a vector of dependent samples of the parameters in Sj
  # All service time distributions are Pert(0.5, 0.6, 0.8) with correlation between
  # (X1, X2) and (X3, X4).
  
  # Pearson correlation
  r1 = 2 * sin(pi/6*r1)
  r2 = 2 * sin(pi/6*r2)
  
  
  z1 = NULL; z2 = NULL;
  z3 = NULL; z4 = NULL;
  RV = NULL
  
  if(any(Sjc==1))
  {
    x1 = xjc[which(Sjc==1)]
    z1 = qnorm(ppert(x1,0.5,0.6,0.8))
  }
  
  if(any(Sjc==2))
  {
    x2 = xjc[which(Sjc==2)]
    z2 = qnorm(ppert(x2,0.5,0.6,0.8))
  }
  
  if(any(Sjc==3))
  {
    x3 = xjc[which(Sjc==3)]
    z3 = qnorm(ppert(x3,0.5,0.6,0.8))
  }
  
  if(any(Sjc==4))
  {
    x4 = xjc[which(Sjc==4)]
    z4 = qnorm(ppert(x4,0.5,0.6,0.8))
  }
  
  for (i in 1:length(Sj))
  {
    index = Sj[i] 
    val = NULL
    
    if(index==1)
    {
      if(is.null(z2))
      {
        val = rpert(n,0.5,0.6,0.8)
        z1 = qnorm(ppert(val,0.5,0.6,0.8))
      }
      else
      {
        z1 = r1 * z2 + sqrt(1-r1^2) * rnorm(n)
        val = qpert(pnorm(z1),0.5,0.6,0.8)
      }
    }
    else if(index ==2)
    {
      if(is.null(z1))
      {
        val = rpert(n,0.5,0.6,0.8)
        z2 = qnorm(ppert(val,0.5,0.6,0.8))
      }
      else
      {
        z2 = r1 * z1 + sqrt(1-r1^2) * rnorm(n)
        val = qpert(pnorm(z2),0.5,0.6,0.8)
      }
    }
    else if(index == 3)
    {
      if(is.null(z4))
      {
        val = rpert(n,0.5,0.6,0.8)
        z3 = qnorm(ppert(val,0.5,0.6,0.8))
      }
      else
      {
        z3 = r2 * z4 + sqrt(1-r2^2) * rnorm(n)
        val = qpert(pnorm(z3),0.5,0.6,0.8)
      }
    }
    else if(index == 4)
    {
      if(is.null(z3))
      {
        val = rpert(n,0.5,0.6,0.8)
        z4 = qnorm(ppert(val,0.5,0.6,0.8))
      }
      else
      {
        z4 = r2 * z3 + sqrt(1-r2^2) * rnorm(n)
        val = qpert(pnorm(z4),0.5,0.6,0.8)
      }
    }
    else 
    {
      val = rpert(n,0.5,0.6,0.8)
    }
    RV <- cbind(RV, val)
  }
  return(RV)
}

x <- shapleyPermRand(model = model, Xall=Xall, Xset=Xset, d=d, Nv=1e3, m = 1e4, No = 1, Ni = 3)
print(x)
plot(x)

## End(No test)




