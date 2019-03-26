library(PASWR)


### Name: nsize
### Title: Required Sample Size
### Aliases: nsize
### Keywords: univar

### ** Examples

nsize(b=0.015, p=0.5, conf.level=.95,type="pi")
    # Returns the required sample size (n) to estimate the population 
    # proportion of successes with a 0.95 confidence interval
    # so that the margin of error is no more than 0.015 when the
    # estimate of the population propotion of successes is 0.5.
    # This is Example 8.25 part b. from PASWR.
    
nsize(b=0.02, sigma=0.1,conf.level=.95,type="mu")
    # Returns the required sample size (n) to estimate the population 
    # mean with a 0.95 confidence interval so that the margin
    # of error is no more than 0.02.  This is Example 8.4 from PASWR.



