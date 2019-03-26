library(pryr)


### Name: %<c-%
### Title: Create a constant (locked) binding.
### Aliases: %<c-%

### ** Examples

x %<c-% 10
#' Generates an error:
## Not run: x <- 20

# Note that because of R's operator precedence rules, you
# need to wrap compound RHS expressions in ()
y %<c-% 1 + 2
y
z %<c-% (1 + 2)
z



