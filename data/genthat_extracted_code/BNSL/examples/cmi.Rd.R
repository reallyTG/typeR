library(BNSL)


### Name: cmi
### Title: Bayesian Estimation of Conditional Mutual Information
### Aliases: cmi

### ** Examples

n=100

x=c(rbinom(n,1,0.2), rbinom(n,1,0.8))
y=c(rbinom(n,1,0.8), rbinom(n,1,0.2))
z=c(rep(1,n),rep(0,n))
cmi(x,y,z,proc=0); cmi(x,y,z,1); cmi(x,y,z,2) 

x=c(rbinom(n,1,0.2), rbinom(n,1,0.8))
u=rbinom(2*n,1,0.1)
y=(x+u)
z=c(rep(1,n),rep(0,n))
cmi(x,y,z); cmi(x,y,z,proc=1); cmi(x,y,z,2) 




