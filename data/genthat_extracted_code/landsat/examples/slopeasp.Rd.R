library(landsat)


### Name: slopeasp
### Title: Calculate slope and aspect from elevation data.
### Aliases: slopeasp
### Keywords: spatial

### ** Examples

	data(dem)
	dem.slopeasp <- slopeasp(dem)

	par(mfrow=c(1,3))
	image(dem)
	image(dem.slopeasp$slope)
	image(dem.slopeasp$aspect)



