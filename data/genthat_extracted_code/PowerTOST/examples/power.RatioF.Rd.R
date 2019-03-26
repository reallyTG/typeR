library(PowerTOST)


### Name: power.RatioF
### Title: Power for equivalence of the ratio of two means with normality
###   on original scale
### Aliases: power.RatioF

### ** Examples

# power for alpha=0.025, ratio0=0.95, theta1=0.8, theta2=1/theta1=1.25
# within-subject CV=0.2, between-subject CV=0.4 
# 2x2 crossover study, n=24
# using all the defaults:
power.RatioF(CV=0.2, CVb=0.4, n=24)
# gives [1] 0.7315357



