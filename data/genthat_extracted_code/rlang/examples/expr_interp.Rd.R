library(rlang)


### Name: expr_interp
### Title: Process unquote operators in a captured expression
### Aliases: expr_interp

### ** Examples

# All tidy NSE functions like quo() unquote on capture:
quo(list(!!(1 + 2)))

# expr_interp() is meant to provide the same functionality when you
# have a formula or expression that might contain unquoting
# operators:
f <- ~list(!!(1 + 2))
expr_interp(f)

# Note that only the outer formula is unquoted (which is a reason
# to use expr_interp() as early as possible in all user-facing
# functions):
f <- ~list(~!!(1 + 2), !!(1 + 2))
expr_interp(f)


# Another purpose for expr_interp() is to interpolate a closure's
# body. This is useful to inline a function within another. The
# important limitation is that all formal arguments of the inlined
# function should be defined in the receiving function:
other_fn <- function(x) toupper(x)

fn <- expr_interp(function(x) {
  x <- paste0(x, "_suffix")
  !!! body(other_fn)
})
fn
fn("foo")



