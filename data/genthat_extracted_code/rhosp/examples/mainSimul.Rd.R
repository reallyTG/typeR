library(rhosp)


### Name: mainSimul
### Title: simulate many times the first model and calculate the risk
###   constant
### Aliases: mainSimul
### Keywords: survey

### ** Examples

arg1Exp <- list(rangen=rexp,nbparam=1,param=list(1/3));
arg1Bin <- list(rangen=rbinom,nbparam=2,param=list(1,1/20));
arg1Unif <- list(rangen=runif,nbparam=2,param=list(0,20));
arg1Lnorm <- list(rangen=rlnorm,nbparam=2,param=list(1/4,1));

arg2Exp <- list(disfun=pexp,nbparam=1,param=list(1/5));
arg2Cst <- list(disfun=pcst <- function(x,p) p ,nbparam=1,param=list(1/3));
arg2Comp <- list(disfun=pcomp <- function(x,mu1,mu2,mu3)
{1-1/3*exp(-mu1* x)-1/2*exp(-mu2 *x)-1/6*exp(-mu3 *x)}
,nbparam=3,param=list(1/3,1/5,1/10));
arg2Gamma <- list(disfun=pgamma,nbparam=2,param=list(3,1/3));
arg2Lnorm <- list(disfun=plnorm,nbparam=2,param=list(1/20,2));

T <- mainSimul(100,100,arg1Exp,arg2Exp)




