library(scrime)


### Name: rowCATTs
### Title: Rowwise Cochran-Armitage Trend Test Based on Tables
### Aliases: rowCATTs
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
##D # The values of the rowwise Cochran-Armitage trend test 
##D # are computed by
##D 
##D rowCATTs(cases, controls)
##D 
##D # which leads to the same results as
##D 
##D rowTrendStats(mat, cl)
##D 
##D # or as 
##D 
##D out <- rowMsquares(cases, controls)
##D n <- ncol(mat)
##D out$stats * n / (n-1)
##D 
##D  
## End(Not run)



