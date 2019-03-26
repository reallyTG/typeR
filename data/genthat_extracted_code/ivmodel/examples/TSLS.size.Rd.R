library(ivmodel)


### Name: TSLS.size
### Title: Sample Size Calculator for the Power of Asymptotic T-test
### Aliases: TSLS.size

### ** Examples

# Assume we performed an asymptotic t-test of TSLS estimator in a study 
# with one IV (l=1) and the only one exogenous variable is the intercept 
# (k=1). We want to calculate the minimum sample size needed for this 
# test to have an at least 0.8 power.

# Suppose the null hypothesis causal effect is 0 and the true causal 
# effect is 1 (beta=1-0=1).
# The correlation between the IV and exposure is .5 (rho_ZD= .5).
# The standard deviation of potential outcome is 1(sigmau= 1). 
# The variance of the exposure is 1 (sigmaDsq=1).
# The significance level for the study is alpha = .05.

### minimum sample size required for aysmptotic t-test
TSLS.size(power=.8, beta=1, rho_ZD=.5, sigmau=1, sigmaDsq=1, alpha =.05)



