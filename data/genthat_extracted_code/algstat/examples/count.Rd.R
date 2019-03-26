library(algstat)


### Name: count
### Title: Count Integer Points in a Polytope
### Aliases: count

### ** Examples

## Not run: 
##D 
##D 
##D 
##D 
##D 
##D spec <- c("x + y <= 10", "x >= 1", "y >= 1")
##D count(spec)
##D count(spec, opts = "--dilation=10")
##D count(spec, opts = "--homog")
##D 
##D # by default, the output from LattE is in
##D list.files(tempdir())
##D list.files(tempdir(), recursive = TRUE)
##D 
##D # ehrhart polynomials
##D count(spec, opts = "--ehrhart-polynomial")
##D count(spec, opts = "--ehrhart-polynomial", mpoly = FALSE)
##D 
##D # ehrhart series (raw since mpoly can't handle rational functions)
##D count(spec, opts = "--ehrhart-series")
##D 
##D # simplified ehrhart series - not yet implemented
##D #count(spec, opts = "--simplified-ehrhart-polynomial")
##D 
##D # first 3 terms of the ehrhart series
##D count(spec, opts = "--ehrhart-taylor=3")
##D 
##D # multivariate generating function
##D count(spec, opts = "--multivariate-generating-function")
##D 
##D 
##D # the number of tables with the same marginals
##D data(politics)
##D count(c(
##D   "x11 + x12 == 10",
##D   "x21 + x22 == 10",
##D   "x11 + x21 == 9",
##D   "x12 + x22 == 11",
##D   "x11 >= 0", "x21 >= 0", "x12 >= 0", "x22 >= 0"
##D ))
##D countTables(politics)
##D 
##D 
##D # by vertices
##D spec <- list(c(1,1),c(10,1),c(1,10),c(10,10))
##D count(spec)
##D count(spec, opts = "--vrep")
##D 
##D code <- "
##D 5 3
##D 1 -1 0
##D 1 0 -1
##D 1 -1 -1
##D 0 1 0
##D 0 0 1
##D "
##D count(code)
##D 
##D 
##D 
## End(Not run)



