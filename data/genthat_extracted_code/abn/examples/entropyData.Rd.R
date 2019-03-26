library(abn)


### Name: entropyData
### Title: Computes an Empirical Estimation of the Entropy from a Table of
###   Counts
### Aliases: entropyData

### ** Examples

## Generate random variable
rv <- rnorm(n = 100, mean = 0, sd = 2)
dist <- list("gaussian")
names(dist) <- c("rv")

## Compute the entropy through discretization
entropyData(freqs.table = discretization(data.df = rv,
data.dists = dist,
discretization.method = "fd",
nb.states = FALSE))



