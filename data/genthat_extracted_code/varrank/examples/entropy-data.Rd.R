library(varrank)


### Name: entropy.data
### Title: Computes an Empirical Estimation of the Entropy from a Table of
###   Counts
### Aliases: entropy.data

### ** Examples

library("varrank")

rv <- rnorm(n = 100, mean = 0, sd = 2)

entropy.data(freqs.table = discretization(data.df = rv,
discretization.method = "fd",
frequency = TRUE)[[1]])



