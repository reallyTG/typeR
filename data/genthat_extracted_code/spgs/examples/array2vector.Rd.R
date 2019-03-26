library(spgs)


### Name: array2vector
### Title: Convert Arrays and Tables to Vectors with Named Elements
### Aliases: array2vector table2vector
### Keywords: array

### ** Examples

a <- array(1:8, dim=rep(2,3), dimnames=list(c("a","b"), c("x","p"), c("v","u")))
array2vector(a)
array2vector(a, sep="")
array2vector(a, sep="", sort=TRUE)
array2vector(a, sep="", sort=TRUE, rev=TRUE)
array2vector(a, sep="", sort=TRUE, decreasing=TRUE)



