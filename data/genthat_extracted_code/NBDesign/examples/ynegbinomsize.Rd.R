library(NBDesign)


### Name: ynegbinomsize
### Title: Two-sample sample size calculation for negative binomial
###   distribution with variable follow-up
### Aliases: ynegbinomsize
### Keywords: negative binomial sample size piecewise exponential piecewise
###   uniform

### ** Examples

##calculating the sample sizes
abc=ynegbinomsize(r0=1.0,r1=0.5,shape0=1,pi1=0.5,alpha=0.05,twosided=1,
    beta=0.2,fixedfu=1,type=4,u=c(0.5,0.5,1),ut=c(0.5,1.0,1.5),
    tfix=1.5,maxfu=1,tchange=c(0,0.5,1),ratec1=c(0.15,0.15,0.15),
    eps=1.0e-03)
###Zhu and Lakkis's sample sizes (i.e. with approximation) 
abc$XN
###Our sample sizes (i.e. without approximation)
abc$tildeXN



