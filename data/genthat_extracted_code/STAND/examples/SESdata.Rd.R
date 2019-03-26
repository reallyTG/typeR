library(STAND)


### Name: SESdata
### Title: Samples from Elevated Surfaces of a Smelter
### Aliases: SESdata
### Keywords: datasets

### ** Examples

data(SESdata)
mle.ses <- unlist(lnorm.ml(SESdata)) # ML for SESdata
print(mle.ses[1:4])  #  ML estimates of parameters
print(mle.ses[5:8])  #  Standard errors of ML estimates
#  Next line produces a lognormal q-q plot with ML line 
qq.lnorm(plend(SESdata),mle.ses[1],mle.ses[2])
title("Lognormal Q-Q plot For SESdata  Example 1 in ORNLTM2005-52")
unlist(efraction.ml(SESdata,gam=0.95,L=0.2))   #  MLE of exceedance fraction and CLs
unlist(percentile.ml(SESdata,p=0.95,gam=0.95)) #  MLE of 95 percentile and CLs




