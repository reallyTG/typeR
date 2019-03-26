library(icosa)


### Name: CarToPol
### Title: Conversion of 3d Cartesian coordinates to polar coordinates
### Aliases: CarToPol

### ** Examples

# some random points
xyz <- rbind(
	 c(6371, 0,0),
	 c(0, 6371,0),
	 c(1000,1000,1000)
)

# conversions
  CarToPol(xyz)



