library(valaddin)


### Name: misc-checkers
### Title: Miscellaneous checkers
### Aliases: misc-checkers vld_all vld_any vld_array vld_call vld_complex
###   vld_data_frame vld_empty vld_environment vld_expression vld_factor
###   vld_false vld_formula vld_function vld_language vld_matrix vld_na
###   vld_name vld_nan vld_number vld_numeric vld_ordered vld_pairlist
###   vld_primitive vld_raw vld_recursive vld_scalar_numeric vld_symbol
###   vld_table vld_true vld_unsorted

### ** Examples

## Not run: 
##D 
##D f <- function(x, y) "Pass"
##D 
##D # Impose the condition that x is a formula
##D g <- firmly(f, vld_formula(~x))
##D g(z ~ a + b, 0)  # [1] "Pass"
##D g(0, 0)          # Error: "Not formula: x"
##D 
##D # Impose the condition that x and y are disjoint (assuming they are vectors)
##D h <- firmly(f, vld_empty(~intersect(x, y)))
##D h(letters[1:3], letters[4:5])  # [1] "Pass"
##D h(letters[1:3], letters[3:5])  # Error: "Not empty: intersect(x, y)"
##D 
##D # Use a custom error message
##D h <- firmly(f, vld_empty("x, y must be disjoint" ~ intersect(x, y)))
##D h(letters[1:3], letters[3:5])  # Error: "x, y must be disjoint"
##D 
##D # vld_true can be used to implement any kind of input validation
##D ifelse_f <- firmly(ifelse, vld_true(~typeof(yes) == typeof(no)))
##D (w <- {set.seed(1); rnorm(5)})
##D # [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
##D ifelse_f(w > 0, 0, "1")  # Error: "Not TRUE: typeof(yes) == typeof(no)"
##D ifelse_f(w > 0, 0, 1)    # [1] 1 0 1 0 0
## End(Not run)




