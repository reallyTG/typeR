library(dynutils)


### Name: has_names
### Title: Check whether an object has certain names
### Aliases: has_names %has_names%

### ** Examples

## Not run: 
##D library(assertthat)
##D li <- list(a = 1, b = 2)
##D 
##D assert_that(li %has_names% "a")
##D # TRUE
##D 
##D assert_that(li %has_names% "c")
##D # Error: li is missing 1 name from "c": "c"
##D 
##D assert_that(li %has_names% letters)
##D # Error: li is missing 24 names from letters: "c", "d", "e", ...
## End(Not run)



