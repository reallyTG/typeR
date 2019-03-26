library(DrBats)


### Name: pca.Deville
### Title: Perform a PCA using Deville's method
### Aliases: pca.Deville

### ** Examples

res <- drbats.simul(N = 5, P = 100, t.range = c(5, 100), breaks = 8)
res.pca <- pca.Deville(res$X, res$t.simul, t.range = c(5, 100), breaks = 8)
res.pca




