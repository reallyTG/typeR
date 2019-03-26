library(NBDesign)


### Name: ynegbinompower
### Title: Two-sample sample size calculation for negative binomial
###   distribution with variable follow-up
### Aliases: ynegbinompower
### Keywords: negative binomial power piecewise exponential piecewise
###   uniform

### ** Examples

##calculating the sample sizes
abc=ynegbinompower(nsize=200,r0=1.0,r1=0.5,shape0=1,
        pi1=0.5,alpha=0.05,twosided=1,fixedfu=1,
        type=4,u=c(0.5,0.5,1),ut=c(0.5,1.0,1.5),
        tchange=c(0,0.5,1),
        ratec1=c(0.15,0.15,0.15),eps=1.0e-03)
###Zhu and Lakkis's powers (i.e. with approximation) 
abc$XPWR
###Our powers (i.e. without approximation)
abc$tildeXPWR



