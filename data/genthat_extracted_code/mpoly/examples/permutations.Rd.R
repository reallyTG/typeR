library(mpoly)


### Name: permutations
### Title: Determine all permutations of a set.
### Aliases: permutations

### ** Examples

permutations(1:3)
permutations(c('first','second','third'))
permutations(c(1,1,3))
apply(permutations(letters[1:6]), 1, paste, collapse = '')



