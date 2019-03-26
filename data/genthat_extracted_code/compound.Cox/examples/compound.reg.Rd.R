library(compound.Cox)


### Name: compound.reg
### Title: Compound shrinkage estimation under the Cox model
### Aliases: compound.reg
### Keywords: compound covariate shrinkage estimation

### ** Examples

### A simulation study ###
n=50 ### sample size
beta_true=c(1,1,0,0,0)
p=length(beta_true) 
t.vec=d.vec=numeric(n)
X.mat=matrix(0,n,p)

set.seed(1)
for(i in 1:n){
  X.mat[i,]=rnorm(p,mean=0,sd=1)
  eta=sum( as.vector(X.mat[i,])*beta_true )
  T=rexp(1,rate=exp(eta))
  C=runif(1,min=0,max=5)
  t.vec[i]=min(T,C)
  d.vec[i]=(T<=C)
}
compound.reg(t.vec,d.vec,X.mat,delta_a=0.1) 
### compare the estimates (beta) with the true value ###
beta_true

### Lung cancer data analysis (Emura et al. 2012 PLoS ONE) ###
data(Lung)
temp=Lung[,"train"]==TRUE
t.vec=Lung[temp,"t.vec"]
d.vec=Lung[temp,"d.vec"]
X.mat=as.matrix( Lung[temp,-c(1,2,3)] )
#compound.reg(t.vec=t.vec,d.vec=d.vec,X.mat=X.mat,delta_a=0.025) # time-consuming process



