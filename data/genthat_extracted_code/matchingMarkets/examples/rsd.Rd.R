library(matchingMarkets)


### Name: rsd
### Title: Random serial dictatorship mechanism
### Aliases: rsd
### Keywords: algorithms

### ** Examples

## Generate preference-matrix
prefs <- matrix(c(1,2,3,
                  3,1,2,
                  1,3,2),
                  byrow = FALSE, ncol = 3)

priority <- c(1,2,3)
nSlots <- c(1,1,1)

rsd(prefs = prefs, priority = priority, nSlots = nSlots)



