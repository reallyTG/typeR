library(MitISEM)


### Name: MargLik
### Title: Marginal Likelihood calculation using Importance Sampling and
###   mixture of Student-t densities as candidate
### Aliases: MargLik

### ** Examples

mit  <- list(p=1,mu=matrix(1),Sigma=matrix(0.1),df=5)
data <- rnorm(100,1)
KERNEL <- function(theta,data,log=TRUE){
  if(is.vector(theta))
    theta = matrix(theta,nrow=1)
  r <- apply(theta,1,function(x,data)(sum(dnorm(data,x,log=log))),data=data)
}
MargLik(N=1000,mit=mit,KERNEL=KERNEL,data=data)



