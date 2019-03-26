library(adegraphics)


### Name: addline
### Title: Adds lines on graphics.
### Aliases: addline addline-methods addline,ADEg-method
###   addline,ADEgS-method
### Keywords: aplot

### ** Examples

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
g1 <- s.label(cbind(varcanoY,varcanoX), labels = row.names(monde84), plabel.cex = 0.8, plot = FALSE)
addline(g1, 0, 1, plines.col = "red", plines.lwd = 0.5, plines.lty = 2)



