library(letsR)


### Name: lets.presab.grid
### Title: Create a presence-absence matrix of species' geographic ranges
###   within a user's grid shapefile (beta version)
### Aliases: lets.presab.grid

### ** Examples

## Not run: 
##D # Grid 
##D sp.r <- rasterToPolygons(raster(resol = 5))
##D slot(sp.r, "data") <- cbind("ID" = 1:length(sp.r),
##D                             slot(sp.r, "data"))
##D  
##D # Species polygons
##D data(Phyllomedusa)
##D projection(Phyllomedusa) <- projection(sp.r)
##D 
##D # PAM
##D resu <- lets.presab.grid(Phyllomedusa, sp.r, "ID")
##D 
##D # Plot
##D rich_plus1 <- rowSums(resu$PAM) + 1
##D colfunc <- colorRampPalette(c("#fff5f0", "#fb6a4a", "#67000d"))
##D colors <- c("white", colfunc(max(rich_plus1)))
##D plot(resu$grid, border = "gray40",
##D      col = colors[rich_plus1])
##D map(add = TRUE)
## End(Not run)





