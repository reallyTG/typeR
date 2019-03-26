library(rlfsm)


### Name: Retrieve_stats
### Title: Retrieve statistics(bias, variance) of estimators based on a set
###   of paths
### Aliases: Retrieve_stats

### ** Examples

m<-45; M<-60; N<-2^10-M
alpha<-1.8; H<-0.8; sigma<-0.3
freq='L';t1=1; t2=2
r=1; k=2; p=0.4

Y<-paths(N_var=10,parallel=TRUE,N=N,m=m,M=M,
         alpha=alpha,H=H,sigma=sigma,freq='L',
         disable_X=FALSE,levy_increments=NULL)

Retrieve_stats(paths=Y,true_val=sigma,Est=sigma_hat,t1=t1,k=2,alpha=alpha,H=H,freq="L")



