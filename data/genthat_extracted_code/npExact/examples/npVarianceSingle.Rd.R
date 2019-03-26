library(npExact)


### Name: npVarianceSingle
### Title: A test for the variance of a bounded random variable based on a
###   single sample of iid observations.
### Aliases: npVarianceSingle
### Keywords: sample single test variance

### ** Examples


## see if the minority share holder shores have a variance greater
## than 0.05
data(mshscores)
scores <- unlist(mshscores)
npVarianceSingle(scores, lower = 0, upper = 1, v = 0.05, ignoreNA = TRUE)




