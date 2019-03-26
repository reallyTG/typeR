library(landsat)


### Name: topocorr
### Title: Topographic correction of remote sensing data.
### Aliases: topocorr
### Keywords: spatial

### ** Examples

	# require slope and aspect for topographic correction
	data(dem)
	dem.slopeasp <- slopeasp(dem)

	# use cosine method of topographic correction
	data(july3)
	july3.topo <- topocorr(july3, dem.slopeasp$slope, dem.slopeasp$aspect, sunelev=61.4, sunazimuth=125.8)




