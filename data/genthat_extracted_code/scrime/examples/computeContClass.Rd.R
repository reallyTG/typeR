library(scrime)


### Name: computeContClass
### Title: Rowwise Contigency Tables
### Aliases: computeContClass
### Keywords: manip

### ** Examples
## Not run: 
##D # Generate an example data set consisting of 10 rows (variables)
##D # and 200 columns (observations) by randomly drawing integers 
##D # between 1 and 3, and a vector of class labels of length 200
##D # indicating that the first 100 observation belong to class 1
##D # and the other 100 to class 2. 
##D 
##D mat <- matrix(sample(3, 2000, TRUE), 10)
##D cl <- rep(1:2, e = 100)
##D 
##D # Applying computeContClass to this data set
##D 
##D out <- computeContClass(mat, cl)
##D 
##D # generates the observed numbers of observations
##D 
##D out$mat.obs
##D 
##D # and the corresponding expected numbers of observations.
##D 
##D out$mat.exp
##D 
## End(Not run)


