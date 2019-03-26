library(rlfsm)


### Name: GenHighEstim
### Title: High frequency estimation procedure for lfsm.
### Aliases: GenHighEstim

### ** Examples

m<-45; M<-60; N<-2^10-M
sigma<-0.3
p<-0.2; p_prime<-0.4

#### Continuous case
lfsm<-path(N=N,m=m,M=M,alpha=1.8,H=0.8,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)$lfsm

GenHighEstim(p=p,p_prime=p_prime,path=lfsm,freq="H")

#### H-1/alpha<0 case
lfsm<-path(N=N,m=m,M=M,alpha=0.8,H=0.8,
           sigma=sigma,freq='H',disable_X=FALSE,seed=3)$lfsm

GenHighEstim(p=p,p_prime=p_prime,path=lfsm,freq="H")




