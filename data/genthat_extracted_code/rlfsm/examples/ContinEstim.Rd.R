library(rlfsm)


### Name: ContinEstim
### Title: Parameter estimation procedure in continuous case.
### Aliases: ContinEstim

### ** Examples

m<-45; M<-60; N<-2^10-M
alpha<-0.8; H<-0.8; sigma<-0.3
p<-0.3; k=3; t1=1; t2=2

lfsm<-path(N=N,m=m,M=M,alpha=alpha,H=H,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)$lfsm
ContinEstim(t1,t2,p,k,path=lfsm,freq='L')



