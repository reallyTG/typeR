library(STAND)


### Name: About-STAND
### Title: Statistical Analysis of Non-detect Data
### Aliases: About-STAND STAND
### Keywords: package

### ** Examples

# Example 1 from Frome and Wambach (2005) ORNL/TM-2005/52
# NOTE THAT FUNCTIONS NAMES AND DETAILS HAVE BEEN REVISED IN THIS PACKAGE
# the results are the same. For example lnorm.ml() replaces mlndln().
data(SESdata)
mle<-lnorm.ml(SESdata)
unlist(mle[1:4])             # ML estimates mu sigma E(X) and sigma^2
unlist(mle[5:8])            # ML Estimates of standard errors
unlist(mle[9:13])            # additional  output from ORNL/TM-2005/52
IH.summary(SESdata,L=0.2)    #  All sumarry statistics for SESdata
#  lognormal q-q plot for SESdata Figure in ORNL/TM-2005/52
qq.lnorm(plend(SESdata),mle$mu,mle$sigma)
title("SESdata: Smelter-Elevated Surfaces")



