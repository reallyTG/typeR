library(adegraphics)


### Name: s.value
### Title: 2-D scatter plot with proportional symbols (bubble plot)
### Aliases: s.value
### Keywords: aplot hplot

### ** Examples
 
data(rpjdl, package = "ade4")
fau.coa <- ade4::dudi.coa(rpjdl$fau, scan = FALSE, nf = 3)
g1 <- s.value(fau.coa$li, fau.coa$li[,3])
update(g1, key = list(space = "right", columns = 1))
g2 <- s.value(fau.coa$li, fau.coa$li[,3], method = "color", plegend.size = 0.8)
g3 <- s.value(fau.coa$li, fau.coa$li[,3], plegend.size = 0.8, symbol = "square",
   method = "color",  col = colorRampPalette(c("yellow", "blue"))(6))
g4 <- s.value(fau.coa$li, fau.coa$li[,3], plot = FALSE)
g5 <- s.value(fau.coa$li, fau.coa$li[, 3], center = 0, method = "size", 
  symbol = "circle", col = c("yellow", "red"), plot = FALSE)
g6 <- ADEgS(c(g4, g5), positions = layout2position(matrix(c(1, 2), 1, 2)), 
  add = matrix(0, ncol = 2, nrow = 2))  
   
data(irishdata, package = "ade4")
irq0 <- data.frame(scale(irishdata$tab, scale = TRUE))
g7 <- s.value(irishdata$xy.utm, irq0, Sp = irishdata$Spatial.contour, paxes.draw = FALSE, 
  pgrid.draw = FALSE, pSp.alpha = 0.4)



