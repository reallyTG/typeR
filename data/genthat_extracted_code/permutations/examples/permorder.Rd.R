library(permutations)


### Name: permorder
### Title: The order of a permutation
### Aliases: permorder

### ** Examples

x <- rperm(5,20)
permorder(x)
permorder(x,FALSE)

stopifnot(all(is.id(x^permorder(x))))
stopifnot(is.id(x^permorder(x,FALSE)))



