library(scrime)


### Name: rowFreqs
### Title: Rowwise Frequencies
### Aliases: rowFreqs
### Keywords: array manip

### ** Examples
## Not run: 
##D # Generate a matrix containing data for 10 categorical 
##D # variables with levels 1, 2, 3.
##D 
##D mat <- matrix(sample(3, 500, TRUE), 10)
##D 
##D rowFreqs(mat)
##D 
##D # leads to the same results as 
##D 
##D rowTables(mat) / ncol(mat)
##D 
##D # If mat contains missing values
##D 
##D mat[sample(500, 20)] <- NA
##D 
##D # then
##D 
##D rowFreqs(mat)
##D 
##D # leads to the same result as
##D 
##D rowTables(mat) / rowSums(!is.na(mat))
##D 
## End(Not run)


