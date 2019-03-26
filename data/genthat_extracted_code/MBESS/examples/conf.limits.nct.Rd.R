library(MBESS)


### Name: conf.limits.nct
### Title: Confidence limits for a noncentrality parameter from a
###   t-distribution
### Aliases: conf.limits.nct
### Keywords: models htest

### ** Examples


# Suppose observed t-value based on 'df'=126 is 2.83. Finding the lower 
# and upper critical values for the population noncentrality parameter 
# with a symmetric confidence interval with 95% confidence is given as:
conf.limits.nct(ncp=2.83, df=126, conf.level=.95)

# Modifying the above example so that a nonsymmetric 95% confidence interval
# can be formed:
conf.limits.nct(ncp=2.83, df=126, alpha.lower=.01, alpha.upper=.04,
conf.level=NULL)

# Modifying the above example so that a single-sided 95% confidence interval
# can be formed:
conf.limits.nct(ncp=2.83, df=126, alpha.lower=0, alpha.upper=.05,
conf.level=NULL)




