library(ade4)


### Name: gridrowcol
### Title: Complete regular grid analysis
### Aliases: gridrowcol
### Keywords: spatial

### ** Examples

w <- gridrowcol(8, 5)
par(mfrow = c(1, 2))
area.plot(w$area, center = w$xy, graph = w$neig, clab = 0.75)
area.plot(w$area, center = w$xy, graph = w$neig, clab = 0.75, label = as.character(1:40))
par(mfrow = c(1, 1))

if(adegraphicsLoaded()) {
  fac1 <- w$orthobasis
  names(fac1) <- as.character(signif(attr(w$orthobasis, "values"), 3))
  s.value(w$xy, fac1, porigin.include = FALSE, plegend.drawKey = FALSE, pgrid.text.cex = 0,
    ylim = c(0, 10))

} else {
  par(mfrow = c(5,8))
  for(k in 1:39)
    s.value(w$xy, w$orthobasis[, k], csi = 3, cleg = 0, csub = 2,
     sub = as.character(signif(attr(w$orthobasis, "values")[k], 3)),
      incl = FALSE, addax = FALSE, cgr = 0, ylim = c(0,10))
  par(mfrow = c(1,1))
}



