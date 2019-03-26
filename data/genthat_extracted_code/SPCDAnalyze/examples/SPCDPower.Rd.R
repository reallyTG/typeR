library(SPCDAnalyze)


### Name: SPCDPower
### Title: Calculate the power, sample size for a Sequential Parallel
###   Comparison Design(SPCD) study
### Aliases: SPCDPower
### Keywords: htest

### ** Examples

SPCDPower(n=150, power=NULL, p=matrix(c(.6,.3,.5,.3),2,2), w=0.5,
placeboProp=.66, drop = .1, alpha = 0.025,effect_size = rep(NULL, 2))



