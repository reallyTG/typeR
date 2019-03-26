library(assertthat)


### Name: assert_that
### Title: Assert that certain conditions are true.
### Aliases: assert_that see_if

### ** Examples

x <- 1
# assert_that() generates errors, so can't be usefully run in
# examples
## Not run: 
##D assert_that(is.character(x))
##D assert_that(length(x) == 3)
##D assert_that(is.dir("asdf"))
##D y <- tempfile()
##D writeLines("", y)
##D assert_that(is.dir(y))
##D assert_that(FALSE, msg = "Custom error message")
## End(Not run)

# But see_if just returns the values, so you'll see that a lot
# in the examples: but remember to use assert_that in your code.
see_if(is.character(x))
see_if(length(x) == 3)
see_if(is.dir(17))
see_if(is.dir("asdf"))
see_if(5 < 3, msg = "Five is not smaller than three")



