library(PowerTOST)


### Name: sampleN.RatioF
### Title: Sample size for equivalence of the ratio of two means with
###   normality on original scale
### Aliases: sampleN.RatioF

### ** Examples

# sample size for a 2x2 cross-over study
# with CVw=0.2, CVb=0.4
# alpha=0.025 (95% CIs), target power = 80%
# 'true' ratio = 95%, BE acceptance limits 80-125%
# using all the defaults:
sampleN.RatioF(CV=0.2, CVb=0.4)
# gives n=28 with an achieved power of 0.807774
# see Hauschke et.al. (2007) Table 10.3a

# sample size for a 2-group parallel study
# with CV=0.4 (total variability) 
# alpha=0.025 (95% CIs), target power = 90%
# 'true' ratio = 90%, BE acceptance limits 75-133.33%
sampleN.RatioF(targetpower=0.9, theta1=0.75, theta0=0.90, CV=0.4, design="parallel")
# gives n=236 with an achieved power of 0.900685
# see Hauschke et.al. (2007) Table 10.2

# a rather strange setting of ratio0! have a look at n.
# it would be better this is not the sample size but your account balance ;-).
sampleN.RatioF(theta0=0.801, CV=0.2, CVb=0.4)




