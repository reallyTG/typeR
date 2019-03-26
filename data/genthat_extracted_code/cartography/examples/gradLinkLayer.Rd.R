library(cartography)


### Name: gradLinkLayer
### Title: Graduated Links Layer
### Aliases: gradLinkLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
mob <- read.csv(system.file("csv/mob.csv", package="cartography"))
# Create a link layer - work mobilities to Fort-de-France (97209)
mob.sf <- getLinkLayer(x = mtq, df = mob[mob$j==97209,], dfid = c("i", "j"))
# Plot the links - Work mobility
plot(st_geometry(mtq), col = "grey60",border = "grey20")
gradLinkLayer(x = mob.sf, df = mob,
              legend.pos = "topright",
              var = "fij", 
              breaks = c(109,500,1000,2000,4679), 
              lwd = c(1,2,4,10),
              col = "#92000090", add = TRUE)



