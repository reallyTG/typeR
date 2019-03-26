library(ellipsis)


### Name: check_dots_used
### Title: Check that all dots have been used
### Aliases: check_dots_used

### ** Examples

f <- function(...) {
  check_dots_used()
  g(...)
}

g <- function(x, y, ...) {
  x + y
}
f(x = 1, y = 2)

f(x = 1, y = 2, z = 3)
f(x = 1, y = 2, 3, 4, 5)



