library(landsat)


### Name: minnaert
### Title: Whole-image and pixel-based Minnaert topographic correction of
###   remote sensing data.
### Aliases: minnaert
### Keywords: spatial

### ** Examples

	# require slope and aspect for topographic correction
	data(dem)
	dem.slopeasp <- slopeasp(dem)

	# use cosine method of topographic correction
	data(july4)
	july4.minpix <- minnaert(july4, dem.slopeasp$slope, dem.slopeasp$aspect, sunelev=61.4, sunazimuth=125.8, slopeclass=c(1, 5, 10, 15, 50))
	july4.minpix$classcoef # all coefficients



