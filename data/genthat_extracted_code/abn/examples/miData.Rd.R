library(abn)


### Name: miData
### Title: Computes an Empirical Estimation of the Entropy from a Table of
###   Counts
### Aliases: miData

### ** Examples

## Generate random variable
Y <- rnorm(n = 100, mean = 0, sd = 2)
X <- rnorm(n = 100, mean = 5, sd = 2)

dist<-list(Y="gaussian", X="gaussian")

miData(freqs.table = discretization(data.df = cbind(X,Y),
data.dists = dist,
discretization.method = "fd",
nb.states = FALSE),method = "mi.raw")



