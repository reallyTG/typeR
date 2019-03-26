library(abind)


### Name: afill
### Title: Fill an array with subarrays
### Aliases: afill afill<- afill<-.default
### Keywords: manip array

### ** Examples

# fill a submatrix defined by the dimnames on y
(x <- matrix(0, ncol=3, nrow=4, dimnames=list(letters[1:4], LETTERS[24:26])))
(y <- matrix(1:4, ncol=2, nrow=2, dimnames=list(letters[2:3], LETTERS[25:26])))
afill(x) <- y
x
all.equal(asub(x, dimnames(y)), y) # TRUE
# fill a slice in a higher dimensional array
x <- array(0, dim=c(2,4,3), dimnames=list(LETTERS[1:2], letters[1:4], LETTERS[24:26]))
y <- matrix(1:4, ncol=2, nrow=2, dimnames=list(letters[2:3], LETTERS[25:26]))
afill(x, 1, , ) <- y
x[1,,]
x[2,,]
all.equal(asub(x, c(1,dimnames(y))), y) # TRUE
# fill multiple slices
x <- array(0, dim=c(2,4,3), dimnames=list(LETTERS[1:2], letters[1:4], LETTERS[24:26]))
y <- matrix(1:4, ncol=2, nrow=2, dimnames=list(letters[2:3], LETTERS[25:26]))
afill(x, TRUE, , ) <- y
x[1,,]
x[2,,]
all.equal(asub(x, c(1,dimnames(y))), y) # TRUE
all.equal(asub(x, c(2,dimnames(y))), y) # TRUE



