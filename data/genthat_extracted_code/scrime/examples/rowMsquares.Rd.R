library(scrime)


### Name: rowMsquares
### Title: Rowwise Linear Trend Test Based on Tables
### Aliases: rowMsquares
### Keywords: htest array

### ** Examples
## Not run: 
##D # Generate a matrix containing data for 10 categorical 
##D # variables with levels 1, 2, 3.
##D 
##D mat <- matrix(sample(3, 500, TRUE), 10)
##D 
##D # Now assume that we consider a case-control study,
##D # i.e. two groups, and that the first 25 columns 
##D # of mat correspond to cases and the remaining 25 
##D # columns to cases. Then a vector containing the 
##D # class labels is given by
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
##D # The values of the rowwise liner trend test are
##D # computed by
##D 
##D rowMsquares(cases, controls)
##D 
##D # which leads to the same results as
##D 
##D listTab <- list(cases, controls)
##D rowMsquares(listTables = listTab)
##D 
##D # or as
##D 
##D rowTrendStats(mat, cl, use.n = FALSE)
##D 
##D # or as
##D 
##D out <- rowCATTs(cases, controls)
##D n <- ncol(mat)
##D out$stats * (n - 1) / n
##D 
##D  
## End(Not run)



