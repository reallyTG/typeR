library(essHist)


### Name: smData
### Title: Smooth discrete data
### Aliases: smData smoothData resolveTies breakTies
### Keywords: manip

### ** Examples

# generate Poisson data (discrete)
set.seed(123)
n      = 100 # number of observations
lambda = 5
x.dis  = rpois(n, lambda)

# smooth discrete data
x.sm   = smData(x.dis)

# compute the essential histogram
eh = essHistogram(x.sm, xname = "Poisson")



