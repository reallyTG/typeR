library(valaddin)


### Name: bare-type-checkers
### Title: Bare type checkers
### Aliases: bare-type-checkers vld_bare_atomic vld_bare_character
###   vld_bare_double vld_bare_integer vld_bare_list vld_bare_logical
###   vld_bare_vector

### ** Examples

## Not run: 
##D 
##D f <- function(x, y) "Pass"
##D 
##D # Impose a check on x: ensure it's a bare logical object (i.e., has no class)
##D f_firm <- firmly(f, vld_bare_logical(~x))
##D x <- structure(TRUE, class = "boolean")
##D f_firm(TRUE, 0)  # [1] "Pass"
##D f_firm(x, 0)     # Error: "Not bare logical: x"
##D 
##D # Use a custom error message
##D msg <- "x should be a logical vector without attributes"
##D f_firm <- firmly(f, vld_bare_logical(msg ~ x))
##D f_firm(x, 0)     # Error: "x should be a logical vector without attributes"
##D 
##D # To impose the same check on all arguments, apply globalize()
##D f_firmer <- firmly(f, globalize(vld_bare_logical))
##D f_firmer(TRUE, FALSE)  # [1] "Pass"
##D f_firmer(TRUE, 0)      # Error: "Not bare logical: `y`"
##D f_firmer(x, 0)         # Errors: "Not bare logical: `x`", "Not bare logical: `y`"
## End(Not run)



