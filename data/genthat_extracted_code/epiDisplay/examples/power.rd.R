library(epiDisplay)


### Name: Power
### Title: Power calculation for two sample means and proportions
### Aliases: power.for.2means power.for.2p
### Keywords: math

### ** Examples

# Suppose, in the example found in 'help(n.for.2p)', 
# given the two proportions are .8 and .6 and the sample size 
# for each group is 60.

power.for.2p(p1=.8, p2=.6, n1=60, n2=60) # 59 percent

# If the means of a continuous outcome variable in the same 
# two groups were 50 and 60 units and the standard deviations were 30 
# and 35 units, then the power to detect a statistical significance 
# would be

power.for.2means(mu1=50, mu2=60, sd1=30, sd2=35, n1=60, n2=60) 
# 39 percent. Note the graphic display



