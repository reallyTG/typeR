library(ade4)


### Name: withinpca
### Title: Normed within principal component analysis
### Aliases: withinpca
### Keywords: multivariate

### ** Examples

data(meaudret)
wit1 <- withinpca(meaudret$env, meaudret$design$season, scannf = FALSE, scaling = "partial")
kta1 <- ktab.within(wit1, colnames = rep(c("S1", "S2", "S3", "S4", "S5"), 4))
unclass(kta1)

# See pta
plot(wit1)



