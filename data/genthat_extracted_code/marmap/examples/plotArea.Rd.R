library(marmap)


### Name: plotArea
### Title: Plotting projected surface areas
### Aliases: plotArea

### ** Examples

# load and plot a bathymetry
data(florida)
plot(florida, lwd = 0.2)
plot(florida, n = 1, lwd = 0.7, add = TRUE)

# Create a point and a buffer around this point
loc <- data.frame(-80, 26)
buf <- create.buffer(florida, loc, radius=1.8)

# Get the surface within the buffer for several depth slices
surf1 <- get.area(buf, level.inf=-200, level.sup=-1)
surf2 <- get.area(buf, level.inf=-800, level.sup=-200)
surf3 <- get.area(buf, level.inf=-3000, level.sup=-800)

s1 <- round(surf1$Square.Km)
s2 <- round(surf2$Square.Km)
s3 <- round(surf3$Square.Km)

# Add buffer elements on the plot
col.surf1 <- rgb(0.7, 0.7, 0.3, 0.3)
col.surf2 <- rgb(0, 0.7, 0.3, 0.3)
col.surf3 <- rgb(0.7, 0, 0, 0.3)

plotArea(surf1, col = col.surf1)
plotArea(surf2, col = col.surf2)
plotArea(surf3, col = col.surf3)
plot(buf, lwd = 0.7)
points(loc, pch = 19, col = "red")

## Add legend
legend("topleft", fill = c(col.surf1, col.surf2, col.surf3),
       legend = c(paste("]-200 ; -1] -",s1,"km2"),
	   			  paste("]-800 ; -200] -",s2,"km2"),
				  paste("]-3000 ; -800] -",s3,"km2")))



