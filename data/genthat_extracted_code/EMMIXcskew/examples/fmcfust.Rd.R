library(EMMIXcskew)


### Name: fmcfust
### Title: Fitting Finite Mixtures of Multivariate Canonical Fundamental
###   Skew t-Distributions
### Aliases: fmcfust summary.fmcfust print.fmcfust
### Keywords: EM algorithm multivariate skew t distribution maximum
###   likelihood estimation

### ** Examples
   
## No test: 
                
#a short demo using geyser data
library(MASS)
Fit <- fmcfust(3, geyser)
summary(Fit)
print(Fit)   
## End(No test)



