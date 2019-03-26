library(rjmcmc)


### Name: rjmcmcpost
### Title: Perform Reversible-Jump MCMC Post-Processing
### Aliases: rjmcmcpost

### ** Examples

## Comparing two binomial models -- see Barker & Link (2013) for further details.

y=c(8,16); sumy=sum(y)
n=c(20,30); sumn=sum(n)

L1=function(p){if((all(p>=0))&&(all(p<=1))) sum(dbinom(y,n,p,log=TRUE)) else -Inf}
L2=function(p){if((p[1]>=0)&&(p[1]<=1)) sum(dbinom(y,n,p[1],log=TRUE)) else -Inf}

g1=function(psi){p=psi}
g2=function(psi){w=n[1]/sum(n); p=c(w*psi[1]+(1-w)*psi[2],psi[2])}
ginv1=function(p){p}
ginv2=function(p){c(sum(n)/n[1]*p[1]-n[2]/n[1]*p[2],p[2])}

p.prior1=function(p){sum(dbeta(p,1,1,log=TRUE))}
p.prior2=function(p){dbeta(p[1],1,1,log=TRUE)+dbeta(p[2],17,15,log=TRUE)}

draw1=function(){rbeta(2,y+1,n-y+1)}
draw2=function(){c(rbeta(1,sumy+1,sumn-sumy+1),rbeta(1,17,15))}

out=rjmcmcpost(post.draw=list(draw1,draw2), g=list(g1,g2), ginv=list(ginv1,ginv2),
               likelihood=list(L1,L2), param.prior=list(p.prior1,p.prior2),
               model.prior=c(0.5,0.5), chainlength=1500)




