library(valaddin)


### Name: type-checkers
### Title: Type checkers
### Aliases: type-checkers vld_atomic vld_character vld_closure vld_double
###   vld_integer vld_list vld_logical vld_null vld_vector

### ** Examples

## Not run: 
##D 
##D f <- function(x, y) "Pass"
##D 
##D # Impose a check on x: ensure it's of type "logical"
##D f_firm <- firmly(f, vld_logical(~x))
##D f_firm(TRUE, 0)  # [1] "Pass"
##D f_firm(1, 0)     # Error: "Not logical: x"
##D 
##D # Use a custom error message
##D f_firm <- firmly(f, vld_logical("x should be a logical vector" ~ x))
##D f_firm(1, 0)     # Error: "x should be a logical vector"
##D 
##D # To impose the same check on all arguments, apply globalize()
##D f_firmer <- firmly(f, globalize(vld_logical))
##D f_firmer(TRUE, FALSE)  # [1] "Pass"
##D f_firmer(TRUE, 0)      # Error: "Not logical: `y`"
##D f_firmer(1, 0)         # Errors: "Not logical: `x`", "Not logical: `y`"
## End(Not run)



