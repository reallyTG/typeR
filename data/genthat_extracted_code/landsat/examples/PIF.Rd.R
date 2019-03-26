library(landsat)


### Name: PIF
### Title: Pseudo-Invariant Features
### Aliases: PIF
### Keywords: spatial

### ** Examples


	# identify pseudo-invariant feature
	data(july3)
	data(july4)
	data(july7)
	july.pif <- PIF(july3, july4, july7)

	# use PIFs to related nov to july Landsat data for band 3
	# properly, would also remove cloudy areas first
	data(nov3)
	# use major axis regression: error in both x and y
	nov.correction <- lmodel2:::lmodel2(july3@data[july.pif@data[,1] == 1, 1] ~ nov3@data[july.pif@data[,1] == 1, 1])$regression.results[2, 2:3]
	nov3.corrected <- nov3
	nov3.corrected@data[,1] <- nov3@data[,1] * nov.correction[2] + nov.correction[1]



