library(MESS)


### Name: power_t_test
### Title: Power calculations for one and two sample t tests with unequal
###   sample size
### Aliases: power_t_test
### Keywords: htest

### ** Examples

# Sampling with a ratio of 1:4
power_t_test(delta=300, sd=450, power=.8, ratio=4)

# Equal group sizes but different sd's
# The sd in the first group is twice the sd in the second group
power_t_test(delta=300, sd=450, power=.8, sd.ratio=.5)

# Fixed group one size to 50 individuals, but looking for the number of individuals in the
# second group. Different sd's with twice the sd in the larger group
power_t_test(n=50, delta=300, sd=450, power=.8, ratio=NULL, sd.ratio=2)



