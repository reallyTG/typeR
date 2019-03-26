library(ePCR)


### Name: interact.all
### Title: Compute all pairwise interactions between the columns of a data
###   matrix
### Aliases: interact.all

### ** Examples

set.seed(1)
somedata <- data.frame(a = rnorm(10), b = rnorm(10), c = runif(10), d = runif(10))
somedata
allinteract <- interact.all(somedata)
allinteract



