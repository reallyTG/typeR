library(ellipsis)


### Name: check_dots_unnamed
### Title: Check that all dots are unnamed
### Aliases: check_dots_unnamed

### ** Examples

f <- function(..., foofy = 8) {
  check_dots_unnamed()
  c(...)
}

f(1, 2, 3, foofy = 4)
f(1, 2, 3, foof = 4)



