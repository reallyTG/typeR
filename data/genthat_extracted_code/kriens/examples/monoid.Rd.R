library(kriens)


### Name: monoid
### Title: Creates the monoid binary operator
### Aliases: monoid

### ** Examples

# A list is a monoid
replicate.10 <- function(x, ret) {
  ret(rep(x, 10))
}

# concatenation is the binary operator for the list monoid
# the empty list is the unit
`%et%` <- monoid(c)

replicate.20 <- do(replicate.10 %et% replicate.10)

# returns a list of 20 "a"s
replicate.20("a")




