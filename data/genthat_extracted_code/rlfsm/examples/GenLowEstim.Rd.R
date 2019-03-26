library(rlfsm)


### Name: GenLowEstim
### Title: Low frequency estimation procedure for lfsm.
### Aliases: GenLowEstim

### ** Examples

m<-45; M<-60; N<-2^10-M
sigma<-0.3
p<-0.3; k=3; t1=1; t2=2

#### Continuous case
lfsm<-path(N=N,m=m,M=M,alpha=1.8,H=0.8,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)$lfsm

GenLowEstim(t1=t1,t2=t2,p=p,path=lfsm,freq="L")

#### H-1/alpha<0 case
lfsm<-path(N=N,m=m,M=M,alpha=0.8,H=0.8,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)$lfsm

GenLowEstim(t1=t1,t2=t2,p=p,path=lfsm,freq="L")

#### The procedure works also for high frequency case
lfsm<-path(N=N,m=m,M=M,alpha=1.8,H=0.8,
           sigma=sigma,freq='H',disable_X=FALSE,seed=3)$lfsm

GenLowEstim(t1=t1,t2=t2,p=p,path=lfsm,freq="H")



