library(cultevo)


### Name: hammingdists
### Title: Pairwise Hamming distances between matrix rows.
### Aliases: hammingdists

### ** Examples

# a 2x2 design using strings
print(strings <- matrix(c("a1", "b1", "a1", "b2", "a2", "b1", "a2", "b2"),
  ncol=2, byrow=TRUE))
hammingdists(strings)

# a 2x3 design using integers
print(integers <- matrix(c(0, 0, 0, 1, 0, 2, 1, 0, 1, 1, 1, 2), ncol=2, byrow=TRUE))
hammingdists(integers)

# a 3x2 design using factors (ncol is always the number of dimensions)
print(factors <- data.frame(colour=c("red", "red", "green", "blue"),
                            animal=c("dog", "cat", "dog", "cat")))
hammingdists(factors)

# if some meaning dimension is not relevant for some combinations of
# meanings (e.g. optional arguments), specifying them as NA in the matrix
# will make them not be counted towards the hamming distance! in this
# example the value of the second dimension does not matter (and does not
# count towards the distance) when the the first dimension has value '1'
print(ignoredimension <- matrix(c(0, 0, 0, 1, 1, NA), ncol=2, byrow=TRUE))
hammingdists(ignoredimension)

# trivial case of a vector: first and last two elements are identical,
# otherwise a difference of one
hammingdists(c(0, 0, 1, 1))



