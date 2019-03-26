library(cape)


### Name: pair.matrix
### Title: Given a vector of elements, create a two-column matrix listing
###   all pairs of elements
### Aliases: pair.matrix
### Keywords: internal

### ** Examples

el <- letters[1:4]
letter.pairs <- pair.matrix(el, ordered = FALSE, self.pairs = FALSE)
print(letter.pairs)

el <- 1:4
num.pairs <- pair.matrix(el, ordered = FALSE, self.pairs = TRUE)
print(num.pairs)



