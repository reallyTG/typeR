library(PCDSpline)


### Name: PCDReg.wf
### Title: Regression analysis of panel count data under the Gamma frailty
###   non-homogeneous Poisson process model
### Aliases: PCDReg.wf
### Keywords: Gamma frailty non-homogeneous Poisson process model

### ** Examples

##Simulated Data

n=13; #the number of subjects

##generate the number of observations for each subject
k=rpois(n,6)+1; K=max(k);
  
##generate random time gaps for each subject
y=matrix(,n,K);
for (i in 1:n){y[i,1:k[i]]=rexp(k[i],1)} 

##get observation time points for each subject
t=matrix(,n,K);
for (i in 1:n){
  for (j in 2:K){
    t[i,1] = y[i,1]
    t[i,j] = y[i,j]+t[i,j-1]
  }
}

##covariate x1 and x2 generated from Normal(0,0.5^2) and Bernoulli(0.5) respectively
x1=rnorm(n,0,0.5); x2=rbinom(n,1,0.5); x=cbind(x1,x2)

##true regression parameters and frailty variance parameter
beta1=1; beta2=-1; nu=0.5; 
parms=c(beta1,beta2)
phi=rgamma(n,nu,nu) 

##true baseline mean function
mu=function(t){2*t^(0.5)} 

##get the number of events between time intervals
z=matrix(,n,K);
xparms=c();for (s in 1:nrow(x)){xparms[s]=sum(x[s,]*parms)}
for (i in 1:n){
 z[i,1]=rpois(1,mu(t[i,1])*exp(xparms[i])*phi[i]) 
 if (k[i]>1){
 z[i,2:k[i]]=rpois(k[i]-1,(mu(t[i,2:k[i]])-mu(t[i,1:(k[i]-1)]))*exp(xparms[i])*phi[i])
 }
}

TestD<-list(t=t, x=x, z=z, k=k, K=K)

fit<-PCDReg.wf(DATA = TestD, order = 1, placement = TRUE, nknot = 3, myknots, 
               binit = c(0.5,-0.5), ninit = 0.1, ginit = seq(0.1,2),
               t.seq = seq(0,15,0.2), tol = 10^(-3))



