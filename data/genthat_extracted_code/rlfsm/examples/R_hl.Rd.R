library(rlfsm)


### Name: R_hl
### Title: R high /low
### Aliases: R_hl

### ** Examples

m<-45; M<-60; N<-2^10-M
alpha<-0.8; H<-0.8; sigma<-0.3
p<-0.3; k=3

lfsm<-path(N=N,m=m,M=M,alpha=alpha,H=H,
           sigma=sigma,freq='L',disable_X=FALSE,seed=3)$lfsm
R_hl(p=p,k=k,path=lfsm)



