library(MBESS)


### Name: ss.aipe.sc
### Title: Sample size planning for Accuracy in Parameter Estimation (AIPE)
###   of the standardized contrast in ANOVA
### Aliases: ss.aipe.sc
### Keywords: design

### ** Examples

# Suppose the population standardized contrast is believed to be .6 
# in some 5-group ANOVA model. The researcher is interested in comparing 
# the average of means of group 1 and 2 with the average of group 3 and 4.

# To calculate the necessary sample size per gorup such that the width 
# of 95 percent confidence interval of the standardized 
# contrast is, with 90 percent assurance, no wider than .4:

# ss.aipe.sc(psi=.6, c.weights=c(.5, .5, -.5, -.5, 0), width=.4, assurance=.90) 



