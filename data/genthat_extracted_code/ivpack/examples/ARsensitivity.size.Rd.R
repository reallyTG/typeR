library(ivpack)


### Name: ARsensitivity.size
### Title: ARsensitivity.size
### Aliases: ARsensitivity.size
### Keywords: ~kwd1 ~kwd2

### ** Examples

### Minimum sample size needed for power of sensitivity analysis over 0.8. 
### In a study where the null hypothesis causal effect is 0,
### the true causal effect is 1, the sample size is 250, the instrument is
### binary with probability .5 (so variance = .25), the standard deviation
### of potential outcome under control is 1, the effect of the instrument
### is to increase the probability of a binary treatment being 1 from .25 to 
### .75.  The function sigmav.func computes the SD of v for a binary instrument, 
### binary treatment. The correlation between u and v is assumed to be .5.  The 
### significance level for the study will be alpha = .05
sigmav.func(prob.d1.given.z1=.75,prob.d1.given.z0=.25,prob.z1=.5)
# The sigmav.func finds sigmav=.4330127

### minimum sample size for Anderson-Rubin test
ARsensitivity.size(power=0.8, k=1, lambda=1, gamma=.5, var.z=.25, sigma1=1,
sigma2=.4330127, rho=.5, alpha = 0.05)

### minimum sample size for sensitivity analysis under the favourable situation, 
### assuming the range of sensitivity allowance is (-0.1, 0.1)
ARsensitivity.size(power=0.8, k=1, lambda=1, gamma=.5, var.z=.25, sigma1=1, 
sigma2=.4330127, rho=.5, alpha = 0.05, Delta=c(-0.1, 0.1), delta=0)

### minimum sample size for sensitivity analysis with unknown delta, assuming 
### the range of sensitivity allowance is (-0.1, 0.1)
ARsensitivity.size(power=0.8, k=1, lambda=1, gamma=.5, var.z=.25, sigma1=1, 
sigma2=.4330127, rho=.5, alpha = 0.05, Delta=c(-0.1, 0.1))




