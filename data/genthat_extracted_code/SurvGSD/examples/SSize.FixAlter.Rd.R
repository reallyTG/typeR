library(SurvGSD)


### Name: SSize.FixAlter
### Title: Maximum sample size for a group sequential test under a
###   generalized gamma survival distribution or a log-logistic survival
###   distribution.
### Aliases: SSize.FixAlter

### ** Examples

# Assume an exponential (log-logistic) survival distribution
# with q0=sigma0=1, mu0=0.367 (xi0=1, zeta0=1.75) for the control arm,
# a uniform patient entry (eta=1,theta=0) and a uniform dropout censoring distribution Unif(0,h)
# having a 15% censoring probability (lfu=0.15) for a study with R=2, T=3 and the interim
# analysis time at t=1,1.5,2,2.5.

# To obtain the required h for the uniform dropout censoring distribution.
Find.h(lfu=0.15, R=2, T=3, q=1, mu=0.367, sigma=1, eta=1, theta=0) ## exponential
Find.h(lfu=0.15, R=2, T=3, q="LLG", mu=1, sigma=1.75, eta=1, theta=0) ## log-logistic

# To obtain the maximum sample size for testing a treatment difference of a hazard ratio of 2/3
# with a type-I error of 0.05 and a power of 0.8.
SSize.FixAlter(t=c(1,1.5,2,2.5), R=2, T=3, FUN.C=function(y) punif(y,0,7.018),
para0=c(1,0.367,1), para1=NULL, haz.r=2/3, rho=0, eta=1, theta=0) # exponential
SSize.FixAlter(t=c(1,1.5,2,2.5), R=2, T=3, FUN.C=function(y) punif(y,0,7.211),
para0=c("LLG",1,1.75), para1=NULL, haz.r=2/3, rho=0, eta=1, theta=0) # log-logistic

# To obtain the maximum sample size for testing H_0:F_0=F_1 with a type-I error of 0.05
# and a power of 0.8, where F_1 is an exponential (log-logistic) distribution
# with the parameter para1=c(1,0.772,1) (para1=c("LLG",1.5,1.75)).
SSize.FixAlter(t=c(1,1.5,2,2.5), R=2, T=3, FUN.C=function(y) punif(y,0,7.018),
para0=c(1,0.367,1), para1=c(1,0.772,1), haz.r=NULL, rho=0, eta=1, theta=0) # exponential
SSize.FixAlter(t=c(1,1.5,2,2.5), R=2, T=3, FUN.C=function(y) punif(y,0,7.211),
para0=c("LLG",1,1.75), para1=c("LLG",1.5,1.75), haz.r=NULL, rho=0, eta=1, theta=0) # log-logistic




