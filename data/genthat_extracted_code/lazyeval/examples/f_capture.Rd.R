library(lazyeval)


### Name: f_capture
### Title: Make a promise explicit by converting into a formula.
### Aliases: f_capture dots_capture

### ** Examples

f_capture(a + b)
dots_capture(a + b, c + d, e + f)

# These functions will follow a chain of promises back to the
# original definition
f <- function(x) g(x)
g <- function(y) h(y)
h <- function(z) f_capture(z)
f(a + b + c)



