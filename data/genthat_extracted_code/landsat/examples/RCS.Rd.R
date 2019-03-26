library(landsat)


### Name: RCS
### Title: Radiometric Control Sets
### Aliases: RCS
### Keywords: spatial

### ** Examples


	# identify radiometric control set
	data(july1)
	data(july2)
	data(july3)
	data(july4)
	data(july5)
	data(july7)
	july.tc <- tasscap("july", 7)
	july.rcs <- RCS(july.tc)

	# use RCS to relate nov to july Landsat data for band 3
	# properly, would also remove cloudy areas first
	data(nov3)
	# use major axis regression: error in both x and y
	nov.correction <- lmodel2:::lmodel2(july3@data[july.rcs@data[,1] == 1, 1] ~ nov3@data[july.rcs@data[,1] == 1, 1])$regression.results[2, 2:3]
	nov3.corrected <- nov3
	nov3.corrected@data[,1] <- nov3@data[,1] * nov.correction[2] + nov.correction[1]




