library(ShapeSelectForest)


### Name: f2a.raster
### Title: Raster based flat-to-annual function.
### Aliases: f2a.raster
### Keywords: models

### ** Examples

## Not run: 
##D 	# define years
##D 	years <- c(1984, 1986:2010)
##D 
##D 	# define a folder for all output
##D 	folder.in <- paste(system.file(package = "ShapeSelectForest"), 
##D 	"extdata", "helpexamples", sep = "/")
##D 	folder.out <- getwd()	
##D 
##D 	# define filenames
##D 	flat.pred.fn <- "MINI_FLATPRED.img"
##D 	b5.fn <- "MINI_B5.img"
##D 	fi.fn <- "MINI_FI.img"
##D 	nbr.fn <- "MINI_NBR.img"
##D 	ndvi.fn <- "MINI_NDVI.img"
##D 	INPUT.bands <- c(b5.fn, fi.fn, nbr.fn, ndvi.fn)
##D 
##D 	# call f2a.raster
##D 	ans <- f2a.raster(years = years, folder.in = folder.in, folder.out = folder.out, 
##D 	OUTPUT.fn = "f2a_example.img", flat.pred.fn = flat.pred.fn, INPUT.bands = INPUT.bands)
## End(Not run)



