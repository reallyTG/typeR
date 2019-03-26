library(rlfsm)


### Name: paths
### Title: Generator of a set of lfsm paths.
### Aliases: paths

### ** Examples

m<-45; M<-60; N<-2^10-M
alpha<-1.8; H<-0.8; sigma<-0.3
freq='L'
r=1; k=2; p=0.4

Y<-paths(N_var=10,parallel=TRUE,N=N,m=m,M=M,
         alpha=alpha,H=H,sigma=sigma,freq='L',
         disable_X=FALSE,levy_increments=NULL)

Hs<-apply(Y,MARGIN=2,H_hat,p=p,k=k)
hist(Hs)




