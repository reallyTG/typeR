library(ade4)


### Name: jv73
### Title: K-tables Multi-Regions
### Aliases: jv73
### Keywords: datasets

### ** Examples

data(jv73)

w <- split(jv73$morpho, jv73$fac.riv)
w <- lapply(w, function(x) t(dudi.pca(x, scann = FALSE)))
w <- ktab.list.dudi(w)

if(adegraphicsLoaded()) {
  if(requireNamespace("sp", quietly = TRUE)) {
    g11 <- s.label(jv73$xy, Sp = jv73$Spatial, pori.incl = FALSE, plab.cex = 0.75, plot = FALSE)
    g12 <- s.class(jv73$xy, jv73$fac.riv, ellipseSize = 0, pellipses.axes.draw = FALSE, 
      starSize = 0, ppoints.cex = 0, plab.cex = 1.25, plot = FALSE)
    g1 <- superpose(g11, g12, plot = TRUE)
  
    g2 <- kplot(sepan(w), perm = TRUE, row.plab.cex = 0, posieig = "none")
  }
  
} else {
  s.label(jv73$xy, contour = jv73$contour, incl = FALSE, clab = 0.75)
  s.class(jv73$xy, jv73$fac.riv, add.p = TRUE, cell = 0, axese = FALSE, csta = 0, 
    cpoi = 0, clab = 1.25)
  
  kplot(sepan(w), perm = TRUE, clab.r = 0, clab.c = 2, show = FALSE)
}


