library(goft)


### Name: gamma_test
### Title: Test for the Gamma distribution
### Aliases: gamma_test

### ** Examples

# Testing the gamma distribution hypothesis on the logarithm of variable Loss 
# of the danishuni data set 
library(fitdistrplus)
data(danishuni) 
logLoss <- log(danishuni$Loss)   # logarithm of Loss variable
logLoss <- logLoss[logLoss > 0]  # observations > 0
gamma_test(logLoss)                 



