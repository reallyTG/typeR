library(ade4)


### Name: vegtf
### Title: Vegetation in Trois-Fontaines
### Aliases: vegtf
### Keywords: datasets

### ** Examples

if(requireNamespace("spdep", quietly = TRUE)) {
  data(vegtf)
  coa1 <- dudi.coa(vegtf$veg, scannf = FALSE)
  ms.coa1 <- multispati(coa1, listw = spdep::nb2listw(vegtf$nb), nfposi = 2, 
    nfnega = 0, scannf = FALSE)
  summary(ms.coa1)
  plot(ms.coa1)
  
  if(adegraphicsLoaded()) {
    g1 <- s.value(vegtf$xy, coa1$li[, 1], Sp = vegtf$Spatial, pSp.col = "white", plot = FALSE)
    g2 <- s.value(vegtf$xy, ms.coa1$li[, 1], Sp = vegtf$Spatial, pSp.col = "white", plot = FALSE)
    g3 <- s.label(coa1$c1, plot = FALSE)
    g4 <- s.label(ms.coa1$c1, plot = FALSE)
    G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  } else {
    par(mfrow = c(2, 2))
    s.value(vegtf$xy, coa1$li[, 1], area = vegtf$area, include.origin = FALSE)
    s.value(vegtf$xy, ms.coa1$li[, 1], area = vegtf$area, include.origin = FALSE)
    s.label(coa1$c1)
    s.label(ms.coa1$c1)
  }
}


