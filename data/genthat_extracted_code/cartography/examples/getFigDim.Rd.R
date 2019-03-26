library(cartography)


### Name: getFigDim
### Title: Get Figure Dimensions
### Aliases: getFigDim

### ** Examples

## Not run: 
##D library(sf)
##D mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
##D 
##D ## PNG export
##D # get figure dimension
##D sizes <- getFigDim(x = mtq, width = 450, mar = c(0,0,1.2,0))
##D # export the map
##D png(filename = "mtq.png", width = sizes[1], height = sizes[2])
##D par(mar = c(0,0,1.2,0))
##D plot(st_geometry(mtq), col = "#D1914D", border = "white", bg = "#A6CAE0")
##D title("Madinina")
##D dev.off()
##D 
##D ## PDF export
##D # get figure dimension
##D sizes <- getFigDim(x = mtq, width = 450, mar = c(1,1,2.2,1))
##D # export the map
##D pdf(file = "mtq.pdf", width = sizes[1]/72, height = sizes[2]/72)
##D par(mar = c(1,1,2.2,1))
##D plot(st_geometry(mtq), col = "#D1914D", border = "white", bg = "#A6CAE0")
##D title("Madinina")
##D dev.off()
## End(Not run)



