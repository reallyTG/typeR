library(UtilityFrailtyPH12)


### Name: UTEFFTOX
### Title: Samples from the posterior of the utility based phase12 model.
### Aliases: UTEFFTOX

### ** Examples

n=100  #Generate Data
YE=rbinom(n,1,.6)
YT=rbinom(n,1,.2)
nDose=5
Doses=sample(1:nDose,n,replace=TRUE)
##Hyperparameters 
HypermeansEFF=c(-1,-.5,0,.5,1,2)
HypermeansTOX=HypermeansEFF
Hypervars=c(1,1,36,36,1)
B=100
UTEFFTOX(YE, YT,Doses,HypermeansEFF,HypermeansTOX, Hypervars, B)



