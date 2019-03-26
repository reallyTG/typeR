library(ade4)


### Name: butterfly
### Title: Genetics-Ecology-Environment Triple
### Aliases: butterfly
### Keywords: datasets

### ** Examples

data(butterfly)

if(adegraphicsLoaded()) {
  if(requireNamespace("sp", quietly = TRUE)) {
    g1 <- s.label(butterfly$xy, Sp = butterfly$Spatial, pSp.col = "white", 
      porigin.include = FALSE, plot = FALSE)
    g2 <- table.value(dist(butterfly$xy), plot = FALSE)
    g3 <- s.value(butterfly$xy, dudi.pca(butterfly$envir, scan = FALSE)$li[, 1], 
      Sp = butterfly$Spatial, pori.inc = FALSE, pSp.col = "transparent", ppoints.cex = 2, 
        plot = FALSE)
    ## mt <- mantel.randtest(dist(butterfly$xy), dist(butterfly$gen), 99)
    G <- ADEgS(list(g1, g2, g3), layout = c(2, 2), plot = TRUE)
  }
} else {
  par(mfrow = c(2, 2))
  s.label(butterfly$xy, contour = butterfly$contour, inc = FALSE)
  table.dist(dist(butterfly$xy), labels = row.names(butterfly$xy)) # depends of mva
  s.value(butterfly$xy, dudi.pca(butterfly$envir, scan = FALSE)$li[,1], 
      contour = butterfly$contour, inc = FALSE, csi = 3)
  plot(mantel.randtest(dist(butterfly$xy), dist(butterfly$gen), 99),
      main = "genetic/spatial")
  par(mfrow = c(1,1))
}


