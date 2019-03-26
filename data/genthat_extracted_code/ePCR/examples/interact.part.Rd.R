library(ePCR)


### Name: interact.part
### Title: Compute a chosen set of pairwise interactions between two sets
###   of columns in a data matrix
### Aliases: interact.part

### ** Examples

set.seed(1)
somedata <- data.frame(a = rnorm(10), b = rnorm(10), c = runif(10), d = runif(10))
somedata
someinteract <- interact.part(somedata, first = c("a", "b"), second = c("c", "d"))
someinteract



