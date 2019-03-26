library(adegraphics)


### Name: s.label
### Title: 2-D scatter plot with labels
### Aliases: s.label
### Keywords: aplot hplot

### ** Examples

x0 <- runif(50, -2, 2)
y0 <- runif(50, -2, 2)
z <- x0 ^ 2 + y0 ^ 2
g1 <- s.label(data.frame(x0, y0), label = as.character(z < 1), paxes.draw = TRUE, 
  axis.text = list(col = "grey"))
  
data(mafragh, package = "ade4")
g2 <- s.label(mafragh$xy, nb = mafragh$nb, paxes.draw = FALSE)

data(irishdata, package = "ade4")
g3 <- s.label(irishdata$xy.utm, Sp = irishdata$Spatial.contour)   
## update irishdata$xy.utm call to irishdata$xy

## Not run: 
##D data(atlas, package = "ade4")
##D   g4 <- s.label(atlas$xy, lab = atlas$names.district, Sp = atlas$Spatial.contour)
##D   g5 <- s.label(atlas$xy, lab = atlas$names.district, Sp = atlas$Spatial)
## End(Not run)



