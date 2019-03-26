library(eRm)


### Name: RSM
### Title: Estimation of rating scale models
### Aliases: RSM
### Keywords: models

### ** Examples

##RSM with 10 subjects, 3 items
res <- RSM(rsmdat)
res
summary(res)                            #eta and beta parameters with CI
thresholds(res)                         #threshold parameters



