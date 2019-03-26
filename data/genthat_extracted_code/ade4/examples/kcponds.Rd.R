library(ade4)


### Name: kcponds
### Title: Ponds in a nature reserve
### Aliases: kcponds
### Keywords: datasets

### ** Examples

data(kcponds)
w <- as.numeric(scalewt(kcponds$tab$N))

if(adegraphicsLoaded()) {
  if(requireNamespace("sp", quietly = TRUE)) {
    g1 <- s.label(kcponds$xy, Sp = kcponds$Spatial, pSp.col = "white", nb = kcponds$nb, 
      plab.cex = 0, paxes.asp = "fill", plot = FALSE)
    g2 <- s.label(kcponds$xy, Sp = kcponds$Spatial, pSp.col = "white", plabels.cex = 0.8, 
      paxes.asp = "fill", plot = FALSE)
    g3 <- s.value(kcponds$xy, w, psub.text = "Nitrogen concentration", paxe.asp = "fill", 
      plot = FALSE)
    G <- rbindADEg(g1, g2, g3, plot = TRUE)
  }

} else {
  par(mfrow=c(3, 1))
  area.plot(kcponds$area)
  s.label(kcponds$xy, add.p = TRUE, cpoi = 2, clab = 0)
  s.label(kcponds$xy, add.p = TRUE, cpoi = 3, clab = 0)
  s.label(kcponds$xy, add.p = TRUE, cpoi = 0, clab = 0, neig = kcponds$neig, cneig = 1)
  area.plot(kcponds$area)
  s.label(kcponds$xy, add.p = TRUE, clab = 1.5)
  s.value(kcponds$xy, w, cleg = 2, sub = "Nitrogen concentration", csub = 4, 
    possub = "topright", include = FALSE)
  par(mfrow = c(1, 1))
}

## Not run: 
##D   par(mfrow = c(3, 1))
##D   pca1 <- dudi.pca(kcponds$tab, scan = FALSE, nf = 4)
##D   if(requireNamespace("spdep", quietly = TRUE)) {
##D     multi1 <- multispati(pca1, spdep::nb2listw(neig2nb(kcponds$neig)), scannf = FALSE, nfposi = 2, 
##D       nfnega = 1)
##D     summary(multi1)
##D   }
##D   par(mfrow = c(1, 1))
## End(Not run)


