library(DrBats)


### Name: pca.proj.Xt
### Title: PCA data projected onto a histogram basis
### Aliases: pca.proj.Xt

### ** Examples

res <- drbats.simul(N = 5, P = 100, t.range = c(5, 100), breaks = 8)
pca.proj.Xt(res$X, res$t.simul, t.range = c(0, 100), breaks = 8)




