library(scrime)


### Name: rowChisq2Class
### Title: Rowwise Pearson's ChiSquare Test Based on Tables
### Aliases: rowChisq2Class rowChisqMultiClass
### Keywords: htest array

### ** Examples
## Not run: 
##D # Generate a matrix containing data for 10 categorical 
##D # variables with levels 1, 2, 3.
##D 
##D mat <- matrix(sample(3, 500, TRUE), 10)
##D 
##D # Now assume that the first 25 columns correspond to
##D # cases and the remaining 25 columns to cases. Then
##D # a vector containing the class labels is given by
##D 
##D cl <- rep(1:2, e=25)
##D 
##D # and the matrices summarizing the numbers of subjects
##D # showing the respective levels at the different variables
##D # are computed by
##D 
##D cases <- rowTables(mat[, cl==1])
##D controls <- rowTables(mat[,cl==2])
##D 
##D # To obtain the ChiSquare values call
##D 
##D rowChisq2Class(cases, controls)
##D 
##D # This leads to the same results as
##D 
##D rowChisqStats(mat, cl)
##D 
##D # or
##D 
##D rowChisqMultiClass(cases, controls)
##D 
##D # or
##D 
##D listTab <- list(cases, controls)
##D rowChisqMultiClass(listTables = listTab)
##D 
##D   
## End(Not run)



