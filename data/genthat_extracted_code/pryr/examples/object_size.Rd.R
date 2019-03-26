library(pryr)


### Name: object_size
### Title: Compute the size of an object.
### Aliases: object_size compare_size

### ** Examples

# object.size doesn't keep track of shared elements in an object
# object_size does
x <- 1:1e4
z <- list(x, x, x)
compare_size(z)

# this means that object_size is not transitive
object_size(x)
object_size(z)
object_size(x, z)

# object.size doesn't include the size of environments, which makes
# it easy to miss objects that are carrying around large environments
f <- function() {
  x <- 1:1e4
  a ~ b
}
compare_size(f())



