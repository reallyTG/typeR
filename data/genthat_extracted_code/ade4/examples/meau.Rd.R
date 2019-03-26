library(ade4)


### Name: meau
### Title: Ecological Data : sites-variables, sites-species, where and when
### Aliases: meau
### Keywords: datasets

### ** Examples

data(meau)
pca1 <- dudi.pca(meau$env, scan = FALSE, nf = 4)
pca2 <- bca(pca1, meau$design$season, scan = FALSE, nf = 2)

if(adegraphicsLoaded()) {
  g1 <- s.class(pca1$li, meau$design$season, psub.text = "Principal Component Analysis", 
    plot = FALSE)
  g2 <- s.class(pca2$ls, meau$design$season, 
    psub.text = "Between seasons Principal Component Analysis", plot = FALSE)
  g3 <- s.corcircle(pca1$co, plot = FALSE)
  g4 <- s.corcircle(pca2$as, plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  s.class(pca1$li, meau$design$season, 
      sub = "Principal Component Analysis")
  s.class(pca2$ls, meau$design$season, sub = "Between seasons Principal Component Analysis")
  s.corcircle(pca1$co)
  s.corcircle(pca2$as)
  par(mfrow = c(1, 1))
}


