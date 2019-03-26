library(gestalt)


### Name: constant
### Title: Values as Functions
### Aliases: constant variable

### ** Examples

# Function with a constant return value
val <- {message("Computing from scratch"); mtcars} %>>>%
  split(.$cyl) %>>>%
  lapply(function(data) lm(mpg ~ wt, data)) %>>>%
  lapply(summary) %>>>%
  sapply(`[[`, "r.squared")

# With every invocation, `val()` is computed anew:
val()
val()

# Declaring `val` as a constant ensures that its value is computed only once.
# On subsequent calls, the computed value is simply fetched:
const <- constant(val)
const()
const()

# As values, `val()` and `const()` are identical. But `const()`, moreover,
# has structure, namely the function `const`:
const

# For instance, you can inspect the intermediate summaries:
head(const, -1)()

# Which can itself be a constant:
summ <- constant(head(const, -1))
summ()
summ()

## Not run: 
##D # Think of `%>>>%` combined with `constant()` as a lazy, structured
##D # alternative to the magrittr `%>%` operator.
##D library(magrittr)
##D 
##D val2 <- mtcars %>%
##D   split(.$cyl) %>%
##D   lapply(function(data) lm(mpg ~ wt, data)) %>%
##D   lapply(summary) %>%
##D   sapply(`[[`, "r.squared")
##D 
##D # `val2` and `const()` are identical values. But whereas `val2` is computed
##D # immediately and carries no structure, `const` embodies the process that
##D # produces its value, and allows you to defer its realization to the
##D # invocation `const()`.
##D stopifnot(identical(val2, const()))
## End(Not run)

# Use `variable()` to recover the original (“variable”) function
val_var <- variable(const)
stopifnot(identical(val_var, val))
val_var()
val_var()




