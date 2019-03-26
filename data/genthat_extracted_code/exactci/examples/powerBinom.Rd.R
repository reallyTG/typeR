library(exactci)


### Name: powerBinom
### Title: Exact Power and Sample Size methods for Bernoulli responses
### Aliases: powerBinom
### Keywords: htest

### ** Examples

# find power to reject H0: p = p0
# when p=p1 (only counting rejections in the correct direction)     
# defaults to exact central test of binom.exact      
powerBinom(n=40,p0=.4,p1=.6)
# The following calculates the sample size
# to have the average length of confidence intervals 
# be at least 0.4 (regardless of the true proportion)
powerBinom(type="cilength",cilength=.4)
# The following answers the question:
# if the true proportion is .001, how many 
# observations do you need to sample to 
# have the probability of seeing at least 1 success be
# at least .9?
powerBinom(power=.9,p1=.001,type="obs1ormore")



