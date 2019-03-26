library(dynutils)


### Name: is_bounded
### Title: Check whether a value within a certain interval
### Aliases: is_bounded

### ** Examples

## Not run: 
##D library(assertthat)
##D assert_that(is_bounded(10))
##D # TRUE
##D 
##D assert_that(is_bounded(10:30))
##D # TRUE
##D 
##D assert_that(is_bounded(Inf))
##D # Error: Inf is not bounded by (-Inf,Inf)
##D 
##D assert_that(is_bounded(10, lower_bound = 20))
##D # Error: 10 is not bounded by (20,Inf)
##D 
##D assert_that(is_bounded(
##D   10,
##D   lower_bound = 20,
##D   lower_closed = TRUE,
##D   upper_bound = 30,
##D   upper_closed = FALSE
##D ))
##D # Error: 10 is not bounded by [20,30)
## End(Not run)



