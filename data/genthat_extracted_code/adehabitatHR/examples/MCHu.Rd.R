library(adehabitatHR)


### Name: MCHu
### Title: The Class "MCHu": Managing Home Ranges Built by Multiple Convex
###   Hulls
### Aliases: MCHu print.MCHu plot.MCHu MCHu.rast MCHu2hrsize spoldf2MCHu
### Keywords: spatial hplot

### ** Examples

## Not run: 
##D data(puechabonsp)
##D 
##D ## The relocations:
##D locs <- puechabonsp$relocs
##D locsdf <- as.data.frame(locs)
##D head(locsdf)
##D 
##D ## Shows the relocations
##D plot(locs, col=as.numeric(locsdf[,1]))
##D 
##D 
##D ## 12 points seems to be a good choice (rough asymptote for all animals)
##D ## the k-LoCoH method:
##D nn <- LoCoH.k(locs[,1], k=12)
##D 
##D ## Graphical display of the results
##D plot(nn, border=NA)
##D 
##D ## Rasterize the home range on the elevation map:
##D image(puechabonsp$map)
##D (oo <- MCHu.rast(nn, puechabonsp$map))
##D image(oo)
##D 
## End(Not run)



