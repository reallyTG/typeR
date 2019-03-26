library(binGroup)


### Name: binPower
### Title: Power Calculation for One Parameter Binomial Problem
### Aliases: binPower binPowerI
### Keywords: htest

### ** Examples


# What is the probability to reject the null hypothesis
# H0: p >= 0.02 in order to show that the alternative
# hypothesis HA: p < 0.02 is very likely in the first
# example of if 200 seeds are taken from a seed lot and
# are checked for the proportion of defectives.
# Assume a true proportion under the alternative:
# p = 0.01, i.e. a absolute difference delta = 0.01 
# to the threshold proportion p.hyp=0.02.
# The null hypothesis can be rejected if the threshold
# p.hyp=0.02 is excluded by an 95 percent upper bound of the 
# Clopper-Pearson CI. What is the probability  of this event?

binPower(n=200, delta=0.01, p.hyp=0.02,
 alternative="less", method="CP")

# Assuming a lower true proportion (if one is satisfied
# also with the situation that we can only reject H0
# in case that the seed lot has a very high purity, e.g.
# only a proportion of 0.001 defectives )

binPower(n=200, delta=0.019, p.hyp=0.02,
 alternative="less", method="CP")

# Or use a higher sample size:

binPower(n=600, delta=0.01, p.hyp=0.02,
 alternative="less", method="CP")




