library(adehabitatHS)


### Name: predict.enfa
### Title: Habitat Suitability Maps Built from the ENFA
### Aliases: predict.enfa
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(lynxjura)
##D 
##D map <- lynxjura$map
##D 
##D ## We keep only "wild" indices.
##D locs <- lynxjura$locs
##D locs <- locs[slot(locs, "data")[,2]!="D",]
##D 
##D pr <- slot(count.points(locs, map), "data")[,1]
##D 
##D (enfa1 <- enfa(dudi.pca(slot(map, "data"), scannf=FALSE),
##D                pr, scannf = FALSE))
##D 
##D ## Compute the prediction
##D pred <- predict(enfa1, map)
##D image(pred)
##D contour(pred, col="green", add=TRUE)
##D points(locs, pch = 3)
##D 
## End(Not run)



