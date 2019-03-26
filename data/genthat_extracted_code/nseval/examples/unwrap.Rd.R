library(nseval)


### Name: unwrap
### Title: Unwrap variable references.
### Aliases: unwrap unwrap.dots

### ** Examples

# different levels of unwrapping:
f <- function(x) { g(x) }
g <- function(y) { h(y) }
h <- function(z) {
  print(arg(z))
  print(unwrap(quo(z)))
  print(unwrap(unwrap(quo(z))))
  print(unwrap(quo(z), recursive=TRUE))
}

w <- 5
f(w)



