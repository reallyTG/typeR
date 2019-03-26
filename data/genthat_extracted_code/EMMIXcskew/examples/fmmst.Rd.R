library(EMMIXcskew)


### Name: fmmst
### Title: Fitting Finite Mixtures of Unrestricted Multivariate Skew t
###   Distributions
### Aliases: fmmst summary.fmmst print.fmmst
### Keywords: EM algorithm multivariate skew t maximum likelihood
###   estimation

### ** Examples
   
## Don't show: 
#example for checks only
library(MASS)
Fit <- fmmst(3, geyser, itmax=1)
summary(Fit)
## End(Don't show)
## No test: 
#a short demo using geyser data
library(MASS)
Fit <- fmmst(3, geyser)
summary(Fit)
print(Fit)
## End(No test) 



