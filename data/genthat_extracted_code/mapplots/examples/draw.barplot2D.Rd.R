library(mapplots)


### Name: draw.barplot2D
### Title: Draw 2-dimensional barplots in an existing plot
### Aliases: draw.barplot2D

### ** Examples

data(landings)
data(coast)
xlim <- c(-15,0)
ylim <- c(50,56)
xyz <- make.xyz(landings$Lon,landings$Lat,landings$LiveWeight,landings$Species)
col <- rainbow(5)
basemap(xlim, ylim, main = "Species composition of gadoid landings")
draw.shape(coast, col="cornsilk")
draw.barplot2D(xyz$x, xyz$y, xyz$z, width = 0.8, height = 0.4, col=col)
legend("topright", legend=colnames(xyz$z), fill=col, bg="lightblue", inset=0.02)  
 
basemap(xlim, ylim, main = "Species composition of gadoid landings")
draw.shape(coast, col="cornsilk")
draw.barplot2D(xyz$x, xyz$y, xyz$z, width = 1, height = 0.5, scale=TRUE, col=col)
legend("topright", legend=colnames(xyz$z), fill=col, bg="lightblue", inset=0.02)



