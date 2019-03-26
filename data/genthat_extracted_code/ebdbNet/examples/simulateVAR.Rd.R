library(ebdbNet)


### Name: simulateVAR
### Title: Simulate Simple Autoregressive Process
### Aliases: simulateVAR
### Keywords: methods

### ** Examples

library(ebdbNet)
tmp <- runif(1) ## Initialize random number generator
set.seed(125214) ## Save seed

## Simulate data
simData <- simulateVAR(R = 5, T = 10, P = 10, v = rep(10, 10), perc = 0.10)
Dtrue <- simData$Dtrue
y <- simData$y



