library(DrBats)


### Name: coinertia.drbats
### Title: Perform Coinertia Analysis on the PCA of the Weighted PCA and
###   Deville's PCA
### Aliases: coinertia.drbats

### ** Examples

res <- drbats.simul(N = 5, P = 100, t.range = c(5, 100), breaks = 8)
res.coinertia <- coinertia.drbats(X = res$X, t = res$t.simul, t.range = c(5, 100), breaks = 8)
res.coinertia




