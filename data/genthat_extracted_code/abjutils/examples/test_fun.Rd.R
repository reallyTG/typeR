library(abjutils)


### Name: test_fun
### Title: Tests a function by checking if its arguments are declared
### Aliases: test_fun

### ** Examples

## Not run: 
##D f <- function(a, b = 3) {
##D   a * b
##D }
##D 
##D test_fun(f)
##D a
##D b
##D 
##D b <- 5
##D test_fun(f)
##D a
##D b
##D 
##D test_fun(f, TRUE)
##D a
##D b
##D 
##D a <- 2
##D test_fun(f)
##D a
##D b
## End(Not run)




