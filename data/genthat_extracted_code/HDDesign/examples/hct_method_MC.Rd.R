library(HDDesign)


### Name: hct_method_MC
### Title: Estimate PCC of HCT Classifiers via implementation of Monte
###   Carlo simulations, using training and testing datasets
### Aliases: hct_method_MC

### ** Examples

set.seed(1)
hct_method_MC(mu0=0.4,p=500,m=10,n=80,hct=hct_beta,alpha0=0.5,nrep=10,p1=0.5,
ss=TRUE,ntest=100,sampling.p=0.5)
#return: 0.801 0.806 0.796



