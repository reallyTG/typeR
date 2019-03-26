library(permutations)


### Name: inverse
### Title: Inverse of a permutation
### Aliases: inverse inverse_word_single inverse_cyclist_single
###   inverse.word inverse.cycle

### ** Examples

x <- rperm(10,6)
inverse(x)

all(is.id(x*inverse(x)))  # should be TRUE

inverse(as.cycle(matrix(1:8,9,8)))




