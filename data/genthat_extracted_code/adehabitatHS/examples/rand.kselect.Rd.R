library(adehabitatHS)


### Name: rand.kselect
### Title: Test of the Third-Order Habitat Selection
### Aliases: rand.kselect print.rand.kselect
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## Loads the data
##D data(puechabonsp)
##D 
##D locs <- puechabonsp$relocs
##D map <- puechabonsp$map
##D 
##D 
##D ## compute the home range of animals (e.g. using the minimum convex
##D ## polygon)
##D pc <- mcp(locs[,"Name"])
##D 
##D ## rasterize it
##D hr <- do.call("data.frame", lapply(1:nrow(pc), function(i) {
##D     overlay(map, geometry(pc[i,]))
##D }))
##D names(hr) <- slot(pc, "data")$id
##D coordinates(hr) <- coordinates(map)
##D gridded(hr) <- TRUE
##D 
##D 
##D ## Compute the number of relocation in each pixel of the map
##D cp <- count.points(locs[,"Name"], map)
##D 
##D ## prepares the data for the kselect analysis
##D x <- prepksel(map, hr, cp)
##D tab <- x$tab
##D dud <- dudi.mix(tab, scannf = FALSE, nf = 2)
##D 
##D ## the randomisation tests
##D ## be patient, this can be very long on some machines
##D (te <- rand.kselect(dud, x$factor, x$weight, nrep = 500))
##D 
## End(Not run)



