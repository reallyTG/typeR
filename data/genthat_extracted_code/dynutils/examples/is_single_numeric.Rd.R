library(dynutils)


### Name: is_single_numeric
### Title: Check whether a value is a single numeric
### Aliases: is_single_numeric

### ** Examples

## Not run: 
##D library(assertthat)
##D assert_that(is_single_numeric(1))
##D # TRUE
##D 
##D assert_that(is_single_numeric(Inf))
##D # TRUE
##D 
##D assert_that(is_single_numeric(1.6))
##D # TRUE
##D 
##D assert_that(is_single_numeric(NA))
##D # Error: NA is not a single numeric value
##D 
##D assert_that(is_single_numeric(1:6))
##D # Error: 1:6 is not a single numeric value
##D 
##D assert_that(is_single_numeric("pie"))
##D # Error: "pie" is not a single numeric value
## End(Not run)



