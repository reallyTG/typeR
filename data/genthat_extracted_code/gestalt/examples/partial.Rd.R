library(gestalt)


### Name: partial
### Title: Fix a Number of Arguments to a Function
### Aliases: partial departial

### ** Examples

# Arguments can be fixed by name
draw3 <- partial(sample, size = 3)
draw3(letters)

# Arguments can be fixed by position
draw3 <- partial(sample, , 3)
draw3(letters)

# Use departial() to recover the original function
stopifnot(identical(departial(draw3), sample))

# Lazily evaluate argument values by default
# The value of 'n' is evaluated whenever rnd() is called.
rnd <- partial(runif, n = rpois(1, 5))
replicate(4, rnd(), simplify = FALSE)   # variable length

# Eagerly evaluate argument values with unquoting (`!!`)
# The value of 'n' is fixed when 'rnd_eager' is created.
rnd_eager <- partial(runif, n = !!rpois(1, 5))
len <- length(rnd_eager())
reps <- replicate(4, rnd_eager(), simplify = FALSE)   # constant length
stopifnot(all(vapply(reps, length, integer(1)) == len))

# Mix evaluation schemes by combining lazy evaluation with unquoting (`!!`)
# Here 'n' is lazily evaluated, while 'max' is eagerly evaluated.
rnd_mixed <- partial(runif, n = rpois(1, 5), max = !!sample(10, 1))
replicate(4, rnd_mixed(), simplify = FALSE)

# Arguments to fix can be spliced
args_eager <- list(n = rpois(1, 5), max = sample(10, 1))
rnd_eager2 <- partial(runif, !!!args_eager)
replicate(4, rnd_eager2(), simplify = FALSE)

args_mixed <- rlang::exprs(n = rpois(1, 5), max = !!sample(10, 1))
rnd_mixed2 <- partial(runif, !!!args_mixed)
replicate(4, rnd_mixed2(), simplify = FALSE)

# partial() truncates formals by the fixed arguments
foo <- function(x, y = x, ..., z = "z") NULL
stopifnot(
  identical(
    formals(partial(foo)),
    formals(foo)
  ),
  identical(
    formals(partial(foo, x = 1)),
    formals(function(y = x, ..., z = "z") {})
  ),
  identical(
    formals(partial(foo, x = 1, y = 2)),
    formals(function(..., z = "z") {})
  ),
  identical(
    formals(partial(foo, x = 1, y = 2, z = 3)),
    formals(function(...) {})
  )
)




