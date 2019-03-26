library(eRm)


### Name: PCM
### Title: Estimation of partial credit models
### Aliases: PCM
### Keywords: models

### ** Examples


##PCM with 10 subjects, 3 items
res <- PCM(pcmdat)
res
summary(res)                #eta and beta parameters with CI
thresholds(res)             #threshold parameters



