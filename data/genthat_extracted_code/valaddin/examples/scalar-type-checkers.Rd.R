library(valaddin)


### Name: scalar-type-checkers
### Title: Scalar type checkers
### Aliases: scalar-type-checkers vld_scalar_atomic vld_scalar_character
###   vld_scalar_double vld_scalar_integer vld_scalar_list
###   vld_scalar_logical vld_scalar_vector vld_boolean vld_string
###   vld_singleton

### ** Examples

## Not run: 
##D 
##D f <- function(x, y) "Pass"
##D 
##D # Impose a check on x: ensure it's boolean (i.e., a scalar logical vector)
##D f_firm <- firmly(f, vld_boolean(~x))
##D f_firm(TRUE, 0)           # [1] "Pass"
##D f_firm(c(TRUE, TRUE), 0)  # Error: "Not boolean: x"
##D 
##D # Use a custom error message
##D f_firm <- firmly(f, vld_boolean("x is not TRUE/FALSE/NA" ~ x))
##D f_firm(c(TRUE, TRUE), 0)  # Error: "x is not TRUE/FALSE/NA"
##D 
##D # To impose the same check on all arguments, apply globalize
##D f_firmer <- firmly(f, globalize(vld_boolean))
##D f_firmer(TRUE, FALSE)    # [1] "Pass"
##D f_firmer(TRUE, 0)        # Error: "Not boolean: `y`"
##D f_firmer(logical(0), 0)  # Errors: "Not boolean: `x`", "Not boolean: `y`"
## End(Not run)



