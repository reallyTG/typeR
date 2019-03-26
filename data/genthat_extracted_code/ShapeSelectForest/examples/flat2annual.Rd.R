library(ShapeSelectForest)


### Name: flat2annual
### Title: flat2annual
### Aliases: flat2annual
### Keywords: models

### ** Examples

	# define years
	years <- c(2001:2010)

	# define parameters
	all.shapes <- c(1, 4, 5, 3)
	all.dyrs <- c(2001, 0, 2004, 2004)
	all.durs <- c(1, 0, 3, 5)
	flat.pred <- 5

	# call flat2annual
	ans <- flat2annual(years = years, all.shapes = all.shapes, all.durs = all.durs,
	all.dyrs = all.dyrs, mtbs = mtbs, flat.pred = flat.pred)



