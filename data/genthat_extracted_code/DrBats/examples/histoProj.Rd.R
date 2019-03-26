library(DrBats)


### Name: histoProj
### Title: Project a set of curves onto a histogram basis
### Aliases: histoProj

### ** Examples

res <- drbats.simul(N = 5, P = 100, t.range = c(5, 100), breaks = 8)
res.proj <- histoProj(res$X, res$t.simul, t.range = c(5, 100), breaks = 8)
res.proj




