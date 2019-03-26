library(DrBats)


### Name: W.QR
### Title: Build and decompose a low-rank matrix W
### Aliases: W.QR

### ** Examples

res <- drbats.simul(N = 5, P = 100, t.range = c(5, 100), breaks = 8)
res.pca <- pca.Deville(res$X, res$t.simul, t.range = c(5, 100), breaks = 8)
Wres.pca <- W.QR(res.pca$U, res.pca$lambda)
Wres.pca




