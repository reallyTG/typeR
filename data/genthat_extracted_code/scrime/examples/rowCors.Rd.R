library(scrime)


### Name: rowCors
### Title: Rowwise Correlation with a Vector
### Aliases: rowCors
### Keywords: manip array

### ** Examples
## Not run: 
##D # Generate a random matrix containing 10 continuous variables
##D # and a vector representing a continuous variable.
##D 
##D mat <- matrix(runif(200, 0, 20), 10)
##D y <- sample(runif(20, 0, 20))
##D 
##D # The correlations between y and each of row of mat are
##D # computed by
##D 
##D rowCors(mat, y)
##D 
##D # Generate a random binary vector and a matrix consisting
##D # of 10 ordinal variables with levels 0, 1, 2, where these 
##D # values can be interpreted as scores for the differ 
##D # categories.
##D 
##D mat <- matrix(sample(0:2, 500, TRUE), 10)
##D y <- sample(0:1, 50, TRUE)
##D 
##D # The values of the Cochran-Armitage trend statistic are
##D # computed by
##D 
##D rowCors(mat, y, trendStat = TRUE)
##D 
##D # If the values of the general test of linear trend described
##D # on page 87 of Agresti (2002) should be computed, then call
##D 
##D rowCors(mat, y, trendStat = TRUE, use.n = FALSE) 
##D 
## End(Not run)


