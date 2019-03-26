library(rlfsm)


### Name: sigma_hat
### Title: Statistical estimator for sigma
### Aliases: sigma_hat

### ** Examples

m<-45; M<-60; N<-2^14-M
alpha<-1.8; H<-0.8; sigma<-0.3
freq='H'
r=1; k=2; p=0.4; t1=1; t2=2

# Reproducing the work of ContinEstim
# in high frequency case
lfsm<-path(N=N,m=m,M=M,alpha=alpha,H=H,
           sigma=sigma,freq='L',disable_X=FALSE,seed=1)$lfsm

H_est<-H_hat(p=p,k=k,path=lfsm)
H_est
alpha_est<-alpha_hat(t1=t1,t2=t2,k=k,path=lfsm,H=H_est,freq=freq)
alpha_est

sigma_est<-tryCatch(
                    sigma_hat(t1=t1,k=k,path=lfsm,
                    alpha=alpha_est,H=H_est,freq=freq),
                    error=function(c) 'Impossible to compute sigma_est')
sigma_est



