library(ShapeSelectForest)


### Name: shapeparams
### Title: Shape Parameters
### Aliases: shapeparams
### Keywords: models

### ** Examples

## Not run: 
##D 	# import the matrix of Landsat signals 
##D 	data("ymat")
##D 	
##D 	# define the predictor vector: the year 1985 to the year 2010
##D 	x <- 1985:2010
##D  	
##D 	# call the shape routine allowing a double-jump shape using "CIC"
##D 	ans <- shape(x, ymat, "CIC")
##D 
##D 	# Example 1: parameters for a flat shape
##D 	flat_id <- which(ans$shape == 1)
##D 	i <- flat_id[1]
##D 	ans_flat <- shapeparams(ans$shape[i], ans$ic[, i], ans$thetab[, i], x)	
##D 
##D 	# Example 2: parameters for a one-jump shape
##D 	jp_id <- which(ans$shape == 3)
##D 	i <- jp_id[1]
##D 	ans_jp <- shapeparams(ans$shape[i], ans$ic[, i], ans$thetab[, i], x)	
##D 
##D 	# Example 3: parameters for a double-jump shape
##D 	db_id <- which(ans$shape == 7)
##D 	i <- db_id[1]
##D 	ans_db <- shapeparams(ans$shape[i], ans$ic[, i], ans$thetab[, i], x)		
## End(Not run)



