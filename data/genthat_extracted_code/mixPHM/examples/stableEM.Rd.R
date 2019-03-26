library(mixPHM)


### Name: stableEM
### Title: Stable EM solution
### Aliases: stableEM
### Keywords: models

### ** Examples


## Exponental mixture model with 2 components for 4 different starting solutions
data(webshop)
res <- stableEM(webshop, K = 2, numEMstart = 4, Sdist = "exponential")
res
summary(res)



