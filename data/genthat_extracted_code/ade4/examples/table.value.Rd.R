library(ade4)


### Name: table.value
### Title: Plot of the Arrays
### Aliases: table.value table.prepare
### Keywords: hplot

### ** Examples

if(!adegraphicsLoaded()) {
  data(olympic)
  w <- olympic$tab
  w <- data.frame(scale(w))
  wpca <- dudi.pca(w, scann = FALSE)
  par(mfrow = c(1, 3))
  table.value(w, csi = 2, clabel.r = 2, clabel.c = 2)
  table.value(w, y = rank(wpca$li[, 1]), x = rank(wpca$co[, 1]), csi = 2,
    clabel.r = 2, clabel.c = 2)
  table.value(w, y = wpca$li[, 1], x = wpca$co[, 1], csi = 2, 
    clabel.r = 2, clabel.c = 2)
  par(mfrow = c(1, 1))
}


