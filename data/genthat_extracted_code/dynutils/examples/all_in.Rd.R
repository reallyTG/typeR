library(dynutils)


### Name: all_in
### Title: Check whether a vector are all elements of another vector
### Aliases: all_in %all_in%

### ** Examples

## Not run: 
##D library(assertthat)
##D assert_that(c(1, 2) %all_in% c(0, 1, 2, 3, 4))
##D # TRUE
##D 
##D assert_that("a" %all_in% letters)
##D # TRUE
##D 
##D assert_that("A" %all_in% letters)
##D # Error: "A" is missing 1 element from letters: "A"
##D 
##D assert_that(1:10 %all_in% letters)
##D # Error: 1:10 is missing 10 elements from letters: 1L, 2L, 3L, ...
## End(Not run)



