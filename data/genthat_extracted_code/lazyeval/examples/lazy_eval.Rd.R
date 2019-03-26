library(lazyeval)


### Name: lazy_eval
### Title: Evaluate a lazy expression.
### Aliases: lazy_eval

### ** Examples

f <- function(x) {
  z <- 100
  ~ x + z
}
z <- 10
lazy_eval(f(10))
lazy_eval(f(10), list(x = 100))
lazy_eval(f(10), list(x = 1, z = 1))

lazy_eval(lazy_dots(a = x, b = z), list(x = 10))



