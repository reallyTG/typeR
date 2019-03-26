library(goft)


### Name: gamma_fit
### Title: Fitting the Gamma distribution to data
### Aliases: gamma_fit

### ** Examples

# Fitting a gamma distribution to the logarithm of variable Loss contained in
# the danishuni data set 
library(fitdistrplus)
data(danishuni) 
logLoss <- log(danishuni$Loss)   # logarithm of Loss variable
logLoss <- logLoss[logLoss > 0]  # observations > 0
gamma_fit(logLoss)                 



