library(pryr)


### Name: partial
### Title: Partial apply a function, filling in some arguments.
### Aliases: partial

### ** Examples

# Partial is designed to replace the use of anonymous functions for
# filling in function arguments. Instead of:
compact1 <- function(x) Filter(Negate(is.null), x)

# we can write:
compact2 <- partial(Filter, Negate(is.null))

# and the generated source code is very similar to what we made by hand
compact1
compact2

# Note that the evaluation occurs "lazily" so that arguments will be
# repeatedly evaluated
f <- partial(runif, n = rpois(1, 5))
f
f()
f()

# You can override this by saying .lazy = FALSE
f <- partial(runif, n = rpois(1, 5), .lazy = FALSE)
f
f()
f()

# This also means that partial works fine with functions that do
# non-standard evaluation
my_long_variable <- 1:10
plot2 <- partial(plot, my_long_variable)
plot2()
plot2(runif(10), type = "l")



