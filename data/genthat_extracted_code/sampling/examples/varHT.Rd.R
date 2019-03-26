library(sampling)


### Name: varHT
### Title: Variance estimators of the Horvitz-Thompson estimator
### Aliases: varHT
### Keywords: survey

### ** Examples

pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
N=length(pik)
n=sum(pik)
# Defines the variable of interest
y=rnorm(N,10,2)
# Draws a Poisson sample of expected size n
s=UPpoisson(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])
# Computes the second-order inclusion prob. for Poisson sampling
pikl=outer(pik,pik,"*")
diag(pikl)=pik
# Computes the variance estimator (method=1, the sample size is not fixed)
varHT(y[s==1],pikl[s==1,s==1],1)
# Draws a Tille sample of size n
s=UPtille(pik)
# Computes the Horvitz-Thompson estimator
HTestimator(y[s==1],pik[s==1])
# Computes the second-order inclusion prob. for Tille sampling
pikl=UPtillepi2(pik)
# Computes the variance estimator (method=2, the sample size is fixed)
varHT(y[s==1],pikl[s==1,s==1],2)



