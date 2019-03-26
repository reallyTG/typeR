library(cartography)


### Name: tilesLayer
### Title: Plot Tiles from Open Map Servers
### Aliases: tilesLayer

### ** Examples

## Not run: 
##D library(sf)
##D mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
##D # Download the tiles, extent = Martinique
##D mtqOSM <- getTiles(x = mtq, type = "osm", crop = TRUE)
##D # Plot the tiles
##D tilesLayer(mtqOSM)
##D # Plot countries
##D plot(st_geometry(mtq), add=TRUE)
##D txt <- "© OpenStreetMap contributors. Tiles style under CC BY-SA, www.openstreetmap.org/copyright"
##D mtext(text = txt, side = 1, adj = 0, cex = 0.7, font = 3)
## End(Not run)



