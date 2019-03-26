library(scrime)


### Name: computeContCells
### Title: Pairwise Contingency Tables
### Aliases: computeContCells
### Keywords: manip

### ** Examples
## Not run: 
##D # Generate an example data set consisting of 5 rows (variables)
##D # and 200 columns (observations) by randomly drawing integers 
##D # between 1 and 3.
##D 
##D mat <- matrix(sample(3, 1000, TRUE), 5)
##D 
##D # Generate the matrix containing the contingency tables for each
##D # pair of rows of mat.
##D 
##D out <- computeContCells(mat)
##D 
##D # out contains both the observed numbers of observations 
##D # summarized by contingency tables
##D 
##D out$mat.obs
##D 
##D # and the number of observations expected under the null hypothesis
##D # of independence.
##D 
##D out$mat.exp
##D 
##D # If, e.g., only the observed number of observations having the same 
##D # value is of interest, call
##D 
##D computeContCells(mat, computeExp = FALSE, justDiag = TRUE)
##D 
## End(Not run)


