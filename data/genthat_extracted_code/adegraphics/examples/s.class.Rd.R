library(adegraphics)


### Name: s.class
### Title: 2-D scatter plot with a partition in classes (levels of a
###   factor)
### Aliases: s.class
### Keywords: aplot hplot

### ** Examples

xy <- cbind.data.frame(x = runif(200, -1, 1), y = runif(200, -1, 1))
posi <- factor(xy$x > 0) : factor(xy$y > 0)
coul <- c("black", "red", "green", "blue")
s.class(xy, fac = posi, col = coul, psub.text = "example s.class", pellipses.col = coul)

s.class(xy, fac = posi, ppoints.cex = 1.5, ellipseSize = 0, starSize = 0,
  ppolygons = list(border = 4:1, col = 1:4, lty = 1:4, lwd = 2, alpha = 0.4),
  chullSize = c(1, 0.5))

s.class(xy, fac = posi, facets = posi, ppoints.cex = 1.5, ellipseSize = 0, starSize = 0,
  ppolygons = list(border = 4:1, col = 1:4, lty = 1:4, lwd = 2, alpha = 0.4),
  chullSize = c(1, 0.5))
  
## Not run: 
##D  
##D s.class(xy, fac = posi, col = coul, psub.text = "example s.class", pellipses.col = coul, 
##D   plabels.cex = 0, key = list(space = "left"))
##D    
##D data(banque, package = "ade4")
##D dudi1 <- ade4::dudi.acm(banque, scannf = FALSE)
##D col <- rainbow(length(levels(banque[, 20])))
##D g1 <- s.label(dudi1$li, psub = list(text = "Factorial map from ACM", cex = 1.5, 
##D   position = "topleft"), plot = FALSE)
##D g2 <- s.class(dudi1$li, banque[, 20], psub = list(text = names(banque)[20], cex = 1.5, 
##D   position = "bottomright"), ellipseSize = 0, starSize = 0.5, pgrid.text.cex = 0, plot = FALSE)
##D g3 <- s.class(dudi1$li, banque[, 20], starSize = 0, ellipseSize = 2, pgrid.text.cex = 0, 
##D   plabels.cex = 1.5, plot = FALSE)
##D g4 <- s.class(dudi1$li, banque[, 20], psub = list(text = names(banque)[20], 
##D   position = "topright"), pgrid.text.cex = 0, col = col, pellipses.lwd = 1.5, plot = FALSE)
##D G1 <- ADEgS(c(g1, g2, g3, g4), layout = c(2, 2))
##D G2 <- s.class(dudi1$li, banque, psub = list(position = "topleft"), pgrid.text.cex = 0, 
##D   starSize = 0, ppoints.cex = 0)
## End(Not run)



