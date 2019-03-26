library(rlfsm)


### Name: alpha_hat
### Title: Statistical estimator for alpha
### Aliases: alpha_hat

### ** Examples


m<-45; M<-60; N<-2^14-M
alpha<-1.8; H<-0.8; sigma<-0.3
freq='H'
r=1; k=2; p=0.4; t1=1; t2=2

# Estimating alpha in the high frequency case
# using preliminary estimation of H
lfsm<-path(N=N,m=m,M=M,alpha=alpha,H=H,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)$lfsm

H_est<-H_hat(p=p,k=k,path=lfsm)
H_est
alpha_est<-alpha_hat(t1=t1,t2=t2,k=k,path=lfsm,H=H_est,freq=freq)
alpha_est




