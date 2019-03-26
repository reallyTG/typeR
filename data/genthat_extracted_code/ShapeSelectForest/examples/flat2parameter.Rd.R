library(ShapeSelectForest)


### Name: flat2parameter
### Title: flat2parameter
### Aliases: flat2parameter
### Keywords: models

### ** Examples

	# define years
	years <- c(2001:2010)

	# define parameters
	all.shapes <- c(1, 4, 5, 3)
	all.dyrs <- c(2001, 0, 2004, 2004)
	all.durs <- c(1, 0, 3, 5)
	all.mags <- c(100, 0, 1000, 1500)
	flat.pred <- 5

	# call flat2parameter
	ans <- flat2parameter(years = years, all.shapes = all.shapes, all.durs = all.durs,
	all.dyrs = all.dyrs, all.mags = all.mags, mtbs = mtbs, flat.pred = flat.pred)



