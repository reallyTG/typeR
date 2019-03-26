library(ade4)


### Name: pta
### Title: Partial Triadic Analysis of a K-tables
### Aliases: pta print.pta plot.pta
### Keywords: multivariate

### ** Examples

data(meaudret)
wit1 <- withinpca(meaudret$env, meaudret$design$season, scan = FALSE, scal = "partial")
kta1 <- ktab.within(wit1, colnames = rep(c("S1", "S2", "S3", "S4", "S5"), 4))
kta2 <- t(kta1)
pta1 <- pta(kta2, scann = FALSE)
pta1
plot(pta1)



