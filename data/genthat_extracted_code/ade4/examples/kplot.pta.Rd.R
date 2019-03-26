library(ade4)


### Name: kplot.pta
### Title: Multiple Graphs for a Partial Triadic Analysis
### Aliases: kplot.pta
### Keywords: multivariate hplot

### ** Examples

data(meaudret)
wit1 <- wca(dudi.pca(meaudret$spe, scan = FALSE, scal = FALSE), 
  meaudret$design$season, scan = FALSE)
kta1 <- ktab.within(wit1, colnames = rep(c("S1", "S2", "S3", "S4", "S5"), 4))
kta2 <- t(kta1)
pta1 <- pta(kta2, scann = FALSE)
kplot(pta1)
kplot(pta1, which.graph = 3)



