library(adegraphics)


### Name: addsegment
### Title: Adds segments on graphics.
### Aliases: addsegment addsegment-methods addsegment,ADEg-method
###   addsegment,ADEgS-method
### Keywords: aplot

### ** Examples

data(deug, package = "ade4")
g11 <- s1d.density(deug$tab[, 1], plot = FALSE)
g12 <- addsegment(g11, x0 = deug$cent[1], x1 = deug$cent[1], y0 = 0, y1 = 1, 
  plines = list(col = "grey30", lwd = 3))
g13 <- addsegment(g11, 
  x0 = deug$cent + seq(0, 1, length.out = length(deug$cent)), 
  x1 = deug$cent + seq(0, 1, length.out = length(deug$cent)), 
  y0 = 0, y1 = 1, 
  plines = list(col = 1:length(deug$cent), lty = 1:length(deug$cent)))
  
# example extracted from the pedagogic file, here: http://pbil.univ-lyon1.fr/R/pdf/tdr65.pdf
data(monde84, package = "ade4")
dfX <- cbind.data.frame(lpib = log(monde84$pib), croipop = monde84$croipop)
dfY <- cbind.data.frame(lmorta = log(monde84$morta), lanal = log(monde84$anal + 1), 
  rscol = sqrt(100 - monde84$scol))
dfX0 <- ade4::scalewt(dfX)
dfY0 <- ade4::scalewt(dfY)
can1 <- cancor(dfX0, dfY0)
varcanoX <- dfX0
varcanoY <- dfY0
g21 <- s.label(cbind(varcanoY,varcanoX), labels = row.names(monde84), plabel.cex = 0.8, 
  plot = FALSE)
g22 <- addsegment(g21, -1.25, -1.25, 1.25, 1.25, plines.col = "purple", plines.lwd = 1.5, 
  plines.lty = 2)



