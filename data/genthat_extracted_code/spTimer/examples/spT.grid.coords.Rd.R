library(spTimer)


### Name: spT.grid.coords
### Title: Grid Coordinates
### Aliases: spT.grid.coords
### Keywords: utility

### ** Examples

##

# Load 29 ozone monitoring locations in New York.

data(NYdata)	
coords <- as.matrix(NYdata[,c(2,3)])

# Find the knots coordinates

knots.coords <- spT.grid.coords(Longitude=c(max(coords[,1]),
          min(coords[,1])), Latitude=c(max(coords[,2]),
          min(coords[,2])),by=c(4,4))      
knots.coords

##



