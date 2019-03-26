library(MESS)


### Name: power_mcnemar_test
### Title: Power Calculations for Exact and Asymptotic McNemar Test in a 2
###   by 2 table
### Aliases: power_mcnemar_test
### Keywords: htest

### ** Examples


# Assume that pi_21 is 0.125 and we wish to detect an OR of 2.
# This implies that pi_12=0.25, and with alpha=0.05, and a power of 90% you get
power_mcnemar_test(n=NULL, paid=.125, psi=2, power=.9)

power_mcnemar_test(n=NULL, paid=.1, psi=2, power=.8, method="normal")
power_mcnemar_test(n=NULL, paid=.1, psi=2, power=.8)






