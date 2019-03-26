library(FedData)


### Name: pal_nlcd
### Title: NLCD colour map palettes
### Aliases: pal_nlcd

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000), 
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D NLCD <- get_nlcd(template=vepPolygon, label='VEPIIN')
##D NLCD <- as.matrix(table(raster::values(NLCD)))
##D cols <- dplyr::filter(pal_nlcd(), code %in% row.names(NLCD))
##D par(xpd = TRUE, mar = c(10, 3, 2, 1))
##D barplot(NLCD, beside = FALSE, col = cols$color) 
##D legend("bottom", legend = cols$description, fill = cols$color, 
##D        ncol = 2, inset = c(0, -0.6))
## End(Not run)



