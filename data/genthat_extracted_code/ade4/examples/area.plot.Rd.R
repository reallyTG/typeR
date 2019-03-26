library(ade4)


### Name: area.plot
### Title: Graphical Display of Areas
### Aliases: area.plot poly2area area2poly area2link area.util.contour
###   area.util.xy area.util.class
### Keywords: hplot

### ** Examples

data(elec88)
par(mfrow = c(2, 2))
area.plot(elec88$area, cpoint = 1)
area.plot(elec88$area, lab = elec88$lab$dep, clab = 0.75)
area.plot(elec88$area, clab = 0.75)
# elec88$neig <- neig(area = elec88$area)
area.plot(elec88$area, graph = elec88$neig, sub = "Neighbourhood graph", possub = "topright")
par(mfrow = c(1, 1))

## Not run: 
##D     par(mfrow = c(3, 3))
##D     for(i in 1:9) {
##D       x <- elec88$tab[,i]
##D       area.plot(elec88$area, val = x, sub = names(elec88$tab)[i], csub = 3, cleg = 1.5)
##D     }
##D     par(mfrow = c(1, 1))
##D     
##D     if(adegraphicsLoaded()) {
##D       if(requireNamespace("sp", quietly = TRUE)) {
##D         s.value(elec88$xy, elec88$tab, Sp = elec88$Spatial,
##D           method = "color", psub.text = names(elec88$tab), psub.cex = 3, 
##D           pSp.col = "white", pgrid.draw = FALSE, porigin.include = FALSE)
##D       }
##D     } else {
##D       par(mfrow = c(3, 3))
##D       for(i in 1:9) {
##D         x <- elec88$tab[, i]
##D         s.value(elec88$xy, elec88$tab[, i], contour = elec88$contour,
##D          meth = "greylevel", sub = names(elec88$tab)[i], csub = 3, 
##D          cleg = 1.5, incl = FALSE)
##D         }
##D       par(mfrow = c(1, 1))
##D     }
##D     
##D     if(!adegraphicsLoaded()) {
##D       data(irishdata)
##D       par(mfrow = c(2, 2))
##D       w <- ade4:::area.util.contour(irishdata$area)
##D       xy <- ade4:::area.util.xy(irishdata$area)
##D       area.plot(irishdata$area, cpoint = 1)
##D       apply(w, 1, function(x) segments(x[1], x[2], x[3], x[4], lwd = 3))
##D       area.plot(irishdata$area, clabel = 1)
##D       s.label(xy, area = irishdata$area, incl = FALSE, clab = 0, 
##D         cpoi = 3, addax = FALSE, contour = w)
##D       s.label(xy, area = irishdata$area, incl = FALSE, 
##D         addax = FALSE, contour = w)
##D       par(mfrow = c(1, 1))
##D 
##D     }
## End(Not run)

data(irishdata)
w <- irishdata$area[c(42:53, 18:25), ]
w
w$poly <- as.factor(as.character(w$poly))
area.plot(w, clab = 2)
 
points(68, 59, pch = 20, col = "red", cex = 3)
points(68, 35, pch = 20, col = "red", cex = 3)
points(45, 12, pch = 20, col = "red", cex = 3)
sqrt((59 - 35) ^ 2) + sqrt((68 - 45) ^ 2 + (35 - 12) ^ 2)
area2link(w)



