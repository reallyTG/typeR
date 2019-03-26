library(cartography)


### Name: gradLinkTypoLayer
### Title: Graduated and Colored Links Layer
### Aliases: gradLinkTypoLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
mob <- read.csv(system.file("csv/mob.csv", package="cartography"))
# Create a link layer - work mobilities to Fort-de-France (97209) and 
# Le Lamentin (97213)
mob.sf <- getLinkLayer(x = mtq, df = mob[mob$j %in% c(97209, 97213),], 
                       dfid = c("i", "j"))
# Plot the links - Work mobility
plot(st_geometry(mtq), col = "grey60",border = "grey20")
gradLinkTypoLayer(x = mob.sf, df = mob,
                  var = "fij", 
                  breaks = c(109,500,1000,2000,4679), 
                  lwd = c(1,2,4,10),
                  var2='j', add = TRUE)



