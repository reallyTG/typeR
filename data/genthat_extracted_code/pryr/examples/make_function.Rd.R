library(pryr)


### Name: make_function
### Title: Make a function from its components.
### Aliases: make_function

### ** Examples

f <- function(x) x + 3
g <- make_function(alist(x = ), quote(x + 3))

# The components of the functions are identical
identical(formals(f), formals(g))
identical(body(f), body(g))
identical(environment(f), environment(g))

# But the functions are not identical because f has src code reference
identical(f, g)

attr(f, "srcref") <- NULL
# Now they are:
stopifnot(identical(f, g))



