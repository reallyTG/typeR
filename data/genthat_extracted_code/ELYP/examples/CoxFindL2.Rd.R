library(ELYP)


### Name: CoxFindL2
### Title: Find the Wilks Confidence Interval Lower Bound for Efun based on
###   the Empirical Likelihood Ratio Function CoxEL
### Aliases: CoxFindL2
### Keywords: nonparametric htest

### ** Examples

## We find 95% lower limit of theta= \Lambda_0(300) exp(\beta)
## where \Lambda and \beta are inside a Cox model.
## First we define a function (Hfun) = I[t <= 300], so that
## the baseline feature is \Lambda_0(300). The second function
## we need to define is (Efun) = what we called theta above.

data(smallcell)
myHfun <- function(t){as.numeric(t <= 300)}
myEfun <- function(beta, theta){theta*exp(beta)}

myy <- smallcell$survival
myd <- smallcell$indicator
myZ <- smallcell$arm

CoxFindL2(BetaMLE=0.5337653, StepSize=c(0.1, 3), 
          Hfun=myHfun, Efun=myEfun, y=myy, d=myd, Z=myZ)



