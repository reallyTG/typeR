library(ShapeSelectForest)


### Name: plotshape
### Title: The Plot Routine for an Object of the Shape Routine
### Aliases: plotshape
### Keywords: graphic routine

### ** Examples

	# import the matrix of Landsat signals 
	data("ymat")	

	# define the predictor vector: the year 1985 to the year 2010
	x <- 1985:2010

	# make a fit by the shape routine using "CIC" 
	# and not allow a double jump shape.
	ans <- shape(x, ymat, "CIC", db = FALSE)

	# make a plot for the 1st column of ymat 
	plotshape(ans, ids = 1, both = TRUE, form = TRUE, tt = "Pixel 420")

	# transpose the layout
	plotshape(ans, ids = 1, both = TRUE, form = TRUE, tt = "Pixel 420", transpose = TRUE)

	# make a plot for each of the first 6 columns of ymat 
	# showing the best shape 
	# and "CIC" values against the 7 shapes for each plot.
	par(mfrow = c(3, 2))
	plotshape(ans, ids = 1:6)

	# make a plot for each of the first 6 columns of ymat
	# showing both the best shape
	# and "CIC" values against the 7 shapes for each plot. 		
	# Let the routine make the layout.  
	plotshape(ans, ids = 1:6, form = TRUE, col = 2)

	# plot the ic values only
	plotshape(ans, ids = 1:6, form = TRUE, col = 5, icpic = TRUE)

	# make a title vector
	tts <- paste('Pixel', 1:36, sep = " ")

	# make all plots for the 36 scatterplots with the title vector 
	plotshape(ans, ids = 1:15, both = TRUE, form = TRUE, tt = tts[1:15], cex = .5)
	plotshape(ans, ids = 16:30, both = TRUE, form = TRUE, tt = tts[16:30], lty = 2, cex = .3)
	plotshape(ans, ids = 31:36, both = TRUE, form = TRUE, tt = tts[31:36], lty = 2, cex = .1)




