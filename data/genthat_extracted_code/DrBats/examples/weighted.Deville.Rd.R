library(DrBats)


### Name: weighted.Deville
### Title: Perform a weighted PCA using Deville's method on a data matrix X
###   that we project onto a histogram basis and weighted
### Aliases: weighted.Deville

### ** Examples

res <- drbats.simul(N = 5, P = 100, t.range = c(5, 100), breaks = 8)
res.weighted <- weighted.Deville(res$X, res$t.simul, t.range = c(5, 100), breaks = 8, Qp = NULL)
res.weighted




