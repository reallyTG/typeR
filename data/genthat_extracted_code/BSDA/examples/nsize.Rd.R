library(BSDA)


### Name: nsize
### Title: Required Sample Size
### Aliases: nsize
### Keywords: univar

### ** Examples


nsize(b=.03, p=708/1200, conf.level=.90, type="pi")
    # Returns the required sample size (n) to estimate the population 
    # proportion of successes with a 0.9 confidence interval 
    # so that the margin of error is no more than 0.03 when the
    # estimate of the population propotion of successes is 708/1200.
    # This is problem 5.38 on page 257 of Kitchen's BSDA.
    
nsize(b=.15, sigma=.31, conf.level=.90, type="mu")
    # Returns the required sample size (n) to estimate the population 
    # mean with a 0.9 confidence interval so that the margin 
    # of error is no more than 0.15.  This is Example 5.17 on page
    # 261 of Kitchen's BSDA.




