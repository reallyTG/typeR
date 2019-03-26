library(pryr)


### Name: sexp_type
### Title: Inspect internal attributes of R objects.
### Aliases: sexp_type inspect inspect refs address typename

### ** Examples

x <- 1:10
## Not run: .Internal(inspect(x))

typename(x)
refs(x)
address(x)

y <- 1L
typename(y)
z <- list(1:10)
typename(z)
delayedAssign("a", 1 + 2)
typename(a)
a
typename(a)

x <- 1:5
address(x)
x[1] <- 3L
address(x)



