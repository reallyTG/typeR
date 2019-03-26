library(ShapeSelectForest)


### Name: shape
### Title: Shape Selection
### Aliases: shape
### Keywords: shape

### ** Examples

	# import the matrix of Landsat signals 
	data("ymat")

	# define the predictor vector: the year 1985 to the year 2010	
	x <- 1985:2010
## Not run: 
##D 	# Example 1:	
##D 	# call the shape routine allowing a double jump shape using "BIC"
##D 	ans <- shape(x, ymat, "BIC")
##D 	plotshape(ans, ids = 1:6, both = TRUE, form = TRUE)
## End(Not run)
	# Example 2:
	# call the shape routine not allowing a double jump shape using "CIC"
	ans <- shape(x, ymat, "CIC", db = FALSE)
	plotshape(ans, ids = 1:6, both = TRUE, form = TRUE)




