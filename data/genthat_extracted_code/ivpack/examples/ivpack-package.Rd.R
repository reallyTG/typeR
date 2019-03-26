library(ivpack)


### Name: ivpack-package
### Title: Instrumental Variable Analyses.
### Aliases: ivpack-package ivpack
### Keywords: package

### ** Examples

### This is the IV model in panel A, column (5) of Table 3 from Card, 1995, "Using 
### Geographic Variation in College Proximity to Esimate the Return from Schooling"
data(card.data)
ivmodel=ivreg(lwage ~ educ + exper + expersq + black + south + smsa + reg661 + reg662 + 
reg663 + reg664 + reg665+ reg666 + reg667 + reg668 + smsa66, ~ nearc4 + exper + 
expersq + black + south + smsa + reg661+ reg662 + reg663 + reg664 + reg665 + reg666 + 
reg667 + reg668 + smsa66, x=TRUE, data=card.data)
# Anderson-Rubin confidence interval for effect of treatment
anderson.rubin.ci(ivmodel)
# Robust to heteroskedasticity standard errors
robust.se(ivmodel)

### Power for a study with in which the null hypothesis causal effect is 0,
### the true causal effect is 1, the sample size is 250, the instrument is
### binary with probability .5 (so variance = .25), the standard deviation
### of potential outcome under control is 1, the effect of the instrument
### is to increase the probability of a binary treatment being 1 from .25 to 
### .75.  The function sigmav.func computes the SD of v for a binary insrument, 
### binary treatment. The correlation between u and v is assumed to be .5.  The 
### significance level for the study will be alpha = .05
sigmav.func(prob.d1.given.z1=.75,prob.d1.given.z0=.25,prob.z1=.5)
# The sigmav.func finds sigmav=.4330127
power.iv(n=250, lambda=1, gamma=.5, var.z=.25, sigmau=1, sigmav=.4330127, rho=.5, 
alpha = 0.05)



