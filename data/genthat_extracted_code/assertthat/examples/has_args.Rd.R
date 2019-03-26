library(assertthat)


### Name: has_args
### Title: Check a function has specified arguments
### Aliases: has_args %has_args%

### ** Examples

has_args(mean, "x")
has_args(mean, "x", exact = TRUE)

see_if(mean %has_args% "x")
see_if(mean %has_args% "y")



