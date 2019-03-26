library(ivmodel)


### Name: AR.power
### Title: Power of the Anderson-Rubin (1949) Test
### Aliases: AR.power
### Keywords: Anderson-Rubin (1949) test Power

### ** Examples

# Assume we calculate the power of AR test in a study with one IV (l=1) 
# and the only one exogenous variable is the intercept (k=1). 

# Suppose the difference between the null hypothesis and true causal 
# effect is 1 (beta=1).
# The sample size is 250 (n=250), the IV variance is .25 (Zadj_sq =.25).
# The standard deviation of potential outcome is 1(sigmau= 1). 
# The coefficient of regressing IV upon exposure is .5 (gamma= .5).
# The correlation between u and v is assumed to be .5 (rho=.5). 
# The standard deviation of first stage error is .4 (sigmav=.4). 
# The significance level for the study is alpha = .05.

# power of Anderson-Rubin test:
AR.power(n=250, k=1, l=1, beta=1, gamma=.5, Zadj_sq=.25, 
         sigmau=1, sigmav=.4, rho=.5, alpha = 0.05)




