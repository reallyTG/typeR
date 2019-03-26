library(permutations)


### Name: length
### Title: Various vector-like utilities for permutation objects.
### Aliases: length.word length.permutation length<-.permutation names
###   names.word names<-.word

### ** Examples


x <- rperm(9,5)
names(x) <- letters[1:9]

data(megaminx)
length(megaminx)   # the megaminx group has 12 generators, one per face.
size(megaminx)     # the megaminx group is a subgroup of S_129.


names(megaminx) <- NULL   # prints more nicely.
megaminx






