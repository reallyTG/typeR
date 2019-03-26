library(descr)


### Name: forODFTable
### Title: Convert an object of class CrossTable into a matrix for odfTable
### Aliases: forODFTable

### ** Examples

## Not run: 
##D library(odfWeave)
##D data(infert, package = "datasets")
##D x <- crosstab(infert$education, infert$induced, expected = TRUE)
##D 
##D # Use the function directly:
##D odfTable(forODFTable(x))
##D 
##D # Create a method for odfTable:
##D odfTable.CrossTable <- function(x) odfTable(forODFTable(x))
##D odfTable(x)
##D methods(odfTable)
## End(Not run)



