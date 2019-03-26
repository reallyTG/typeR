library(scrime)


### Name: identifyMonomorphism
### Title: Identification of Constant Variables
### Aliases: identifyMonomorphism
### Keywords: manip

### ** Examples
## Not run: 
##D # Generate a data set consisting of 10 rows and 15 columns,
##D # where the values are randomly drawn from the integers 1, 2, and 3,
##D # and row 3 and 7 consist only of one level.
##D 
##D mat <- matrix(sample(3, 2000, TRUE), 10)
##D mat[3, ] <- 1
##D mat[7, ] <- 2
##D 
##D identifyMonomorphism(mat)
##D 
## End(Not run)


