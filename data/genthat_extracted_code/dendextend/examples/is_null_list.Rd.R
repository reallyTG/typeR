library(dendextend)


### Name: is_null_list
### Title: Checks if the value is and empty list()
### Aliases: is_null_list

### ** Examples

# I can run this only if I'd make is_null_list exported
## Not run: 
##D # TRUE:
##D is_null_list(list())
##D # FALSE
##D is_null_list(list(1))
##D is_null_list(1)
##D 
##D x <- list(1, list(), 123)
##D ss_list <- sapply(x, is_null_list)
##D x <- x[!ss_list]
##D x
##D 
##D x <- list(1, list(), 123)
##D ss_list <- sapply(x, is_null_list)
##D x <- list(list())
##D x
## End(Not run)

## Not run: 
##D # error
##D is_null_list() 
## End(Not run)



