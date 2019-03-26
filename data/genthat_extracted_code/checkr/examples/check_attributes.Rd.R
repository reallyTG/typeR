library(checkr)


### Name: check_attributes
### Title: Check Attributes
### Aliases: check_attributes

### ** Examples

x <- 1
attributes(x) <- list(y = 2L)
check_attributes(x, values = list(y = 3:4), error = FALSE)



