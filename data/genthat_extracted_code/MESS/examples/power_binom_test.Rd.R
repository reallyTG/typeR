library(MESS)


### Name: power_binom_test
### Title: Power Calculations for Exact Test of a simple null hypothesis in
###   a Bernoulli experiment
### Aliases: power_binom_test
### Keywords: htest

### ** Examples


power_binom_test(n = 50, p0 = .50, pa = .75)      ## => power = 0.971
power_binom_test(p0 = .50, pa = .75, power = .90) ## =>     n = 41
power_binom_test(n = 50, p0 = .25, power = .90, alternative="less")  ## => pa = 0.0954




