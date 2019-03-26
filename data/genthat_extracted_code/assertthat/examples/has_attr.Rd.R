library(assertthat)


### Name: has_attr
### Title: Has attribute or name?
### Aliases: has_attr %has_attr% has_name %has_name%

### ** Examples

has_attr(has_attr, "fail")
x <- 10
x %has_attr% "a"

y <- list(a = 1, b = 2)
see_if(y %has_name% "c")



