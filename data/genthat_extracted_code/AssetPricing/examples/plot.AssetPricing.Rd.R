library(AssetPricing)


### Name: plot.AssetPricing
### Title: Plot a list of asset pricing functions.
### Aliases: plot.AssetPricing
### Keywords: hplot

### ** Examples

## Not run: 
##D S <- expression(exp(-kappa*x/(1+gamma*exp(-beta*t))))
##D attr(S,"parvec") <- c(kappa=10/1.5,gamma=9,beta=1)
##D LAMBDA <- function(tt){
##D     if(tt<0 | tt> 1) 0 else 36*(1-tt)
##D }
##D OUT <- xsolve(S=S,lambda=LAMBDA,gprob=(5:1)/15,tmax=1,qmax=30,
##D                   alpha=0.5,type="dip",verbInt=2)
##D GLND <- rep(FALSE,30)
##D GLND[c(1:5,10,15,20,30)] <- TRUE
##D plot(OUT,witch="e",xlab="residual time",ylab="expected revenue",
##D      gloss=TRUE,glind=GLND)
##D GRPS <- data.frame(group=rep(1:6,each=5),q=1:30)
##D GLND <- c(TRUE,FALSE,TRUE,FALSE,TRUE,rep(c(rep(FALSE,4),TRUE),5))
##D plot(OUT,witch="e",groups=GRPS,xlab="residual time",ylab="expected revenue",
##D      gloss=TRUE,glind=GLND)
##D GRPS <- data.frame(group=rep(1:5,each=6),j=rep(1:5,each=6))
##D GRPS$q <- with(GRPS,pmax(j,rep(c(1,6,11,16,21,26),5)))
##D GLND <- rep(c(TRUE,TRUE,rep(FALSE,3),TRUE),5)
##D plot(OUT,witch="p",groups=GRPS,mfrow=c(3,2),gloss=TRUE,glind=GLND,xlab="price")
##D # Pretty messy looking:
##D GRPS$group <- 1
##D GLND <- unlist(lapply(1:5,function(k){(1:6)==k}))
##D plot(OUT,witch="p",groups=GRPS,gloss=TRUE,glind=GLND,cols=GRPS$j,xlab="price")
## End(Not run)



