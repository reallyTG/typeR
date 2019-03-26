library(pipeliner)


### Name: func_error_handler
### Title: Custom error handler for printing the name of an enclosing
###   function with error
### Aliases: func_error_handler

### ** Examples

## Not run: 
##D f <- function(x) x ^ 2
##D tryCatch(f("a"), error = function(e) func_error_handler(e, "f"))
##D # Error in x^2 : non-numeric argument to binary operator
##D # ---> called from within function: f
## End(Not run)



