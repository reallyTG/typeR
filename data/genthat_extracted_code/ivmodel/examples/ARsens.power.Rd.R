library(ivmodel)


### Name: ARsens.power
### Title: Power of the Anderson-Rubin (1949) Test with Sensitivity
###   Analysis
### Aliases: ARsens.power
### Keywords: Anderson-Rubin (1949) test Power Sensitivity analysis

### ** Examples

# Assume we calculate the power of sensitivity analysis in a study with
# one IV (l=1) and the only exogenous variable is the intercept (k=1). 

# Suppose the difference between the null hypothesis and true causal 
# effect is 1 (beta=1).
# The sample size is 250 (n=250), the IV variance is .25 (Zadj_sq =.25).
# The standard deviation of potential outcome is 1(sigmau= 1). 
# The coefficient of regressing IV upon exposure is .5 (gamma= .5).
# The correlation between u and v is assumed to be .5 (rho=.5). 
# The standard deviation of first stage error is .4 (sigmav=.4). 
# The significance level for the study is alpha = .05.

# power of sensitivity analysis under the favorable situation, 
# assuming the range of sensitivity allowance is (-0.1, 0.1)
ARsens.power(n=250, k=1, beta=1, gamma=.5, Zadj_sq=.25, sigmau=1, 
     sigmav=.4, rho=.5, alpha = 0.05, deltarange=c(-0.1, 0.1), delta=0)

# power of sensitivity analysis with unknown delta, 
# assuming the range of sensitivity allowance is (-0.1, 0.1)
ARsens.power(n=250, k=1, beta=1, gamma=.5, Zadj_sq=.25, sigmau=1, 
     sigmav=.4, rho=.5, alpha = 0.05, deltarange=c(-0.1, 0.1))




