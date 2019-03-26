library(spuRs)


### Name: fitDistances
### Title: Function to fit a model to seed transect distance/count data.
### Aliases: fitDistances
### Keywords: manip

### ** Examples

library(MASS)
s1 <- trapTransect(distances = 1:4, seed.counts = c(4, 3, 2, 0))
allTraps <- transectHolder(s1, family="Weibull")
fitDistances(allTraps, "exponential")



