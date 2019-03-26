library(checkr)


### Name: check_no_attributes
### Title: Check No Attributes
### Aliases: check_no_attributes

### ** Examples

x <- 1
attributes(x) <- list(y = 2L)
check_no_attributes(x, error = FALSE)



