library(ade4)


### Name: buech
### Title: Buech basin
### Aliases: buech
### Keywords: datasets

### ** Examples

data(buech)
if(adegraphicsLoaded()) {
  if(requireNamespace("sp", quietly = TRUE)) {
    g1 <- s.label(buech$xy, Sp = buech$Spatial, nb = buech$nb, 
      pSp.col = "transparent", plot = FALSE)
    g2 <- s.value(buech$xy, buech$tab2$Suspens - buech$tab1$Suspens, 
      Sp = buech$Spatial, nb = buech$nb, pSp.col = "transparent", plot = FALSE)
    G <- cbindADEg(g1, g2, plot = TRUE)
  }
} else {
  par(mfrow = c(1,2))
  s.label(buech$xy, contour = buech$contour, neig = buech$neig)
  s.value(buech$xy, buech$tab2$Suspens - buech$tab1$Suspens,
    contour = buech$contour, neig = buech$neig, csi = 3)
  par(mfrow = c(1,1))
}


