library(EWGoF)


### Name: LK.test
### Title: GoF tests based on the likelihood for the Exponential
###   distribution
### Aliases: LK.test
### Keywords: Score test Wald test Likelihood ratio test Cox-Oakes

### ** Examples

x <- rgamma(20,0.3)

#Apply the Cox and Oakes test (score) test
LK.test(x,type="CO")

# Apply the test based on Wald
LK.test(x,type="W")

# Apply the test based on the likelihood ratio
LK.test(x,type="LR")



