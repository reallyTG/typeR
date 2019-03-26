library(abind)


### Name: asub
### Title: Arbitrary subsetting of array-like objects at specified indices
### Aliases: asub asub.default
### Keywords: manip array

### ** Examples

x <- array(1:24,dim=c(2,3,4),dimnames=list(letters[1:2],LETTERS[1:3],letters[23:26]))
asub(x, 1, 1, drop=FALSE)
asub(x, list(1:2,3:4), c(1,3))



