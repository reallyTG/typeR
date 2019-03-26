library(landsat)


### Name: dem
### Title: Digital Elevation Model
### Aliases: dem
### Keywords: datasets

### ** Examples

	data(dem)
	dem.slopeasp <- slopeasp(dem)

	par(mfrow=c(1,3))
	image(dem)
	image(dem.slopeasp$slope)
	image(dem.slopeasp$aspect)



