library(rjmcmc)


### Name: defaultpost
### Title: Perform Post-Processing Using Default Bijections
### Aliases: defaultpost

### ** Examples

## Comparing two binomial models -- see Barker & Link (2013) for further details.

y=c(8,16); sumy=sum(y)
n=c(20,30); sumn=sum(n)

L1=function(p){if((all(p>=0))&&(all(p<=1))) sum(dbinom(y,n,p,log=TRUE)) else -Inf}
L2=function(p){if((p[1]>=0)&&(p[1]<=1)) sum(dbinom(y,n,p[1],log=TRUE)) else -Inf}

p.prior1=function(p){sum(dbeta(p,1,1,log=TRUE))}
p.prior2=function(p){dbeta(p[1],1,1,log=TRUE)+dbeta(p[2],17,15,log=TRUE)}

coda1=matrix(rbeta(2000,y+1,n-y+1), 1000, 2, byrow=TRUE)  ## full conditional posterior
coda2=matrix(c(rbeta(1000,sumy+1,sumn-sumy+1),rbeta(1000,17,15)), 1000, 2)

out=defaultpost(posterior=list(coda1,coda2), likelihood=list(L1,L2), 
                param.prior=list(p.prior1,p.prior2), model.prior=c(1,1), chainlength=1000)




