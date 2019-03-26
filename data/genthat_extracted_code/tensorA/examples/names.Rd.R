library(tensorA)


### Name: names.tensor
### Title: Getting and setting index and dimensionnames of a tensor
### Aliases: names.tensor names<-.tensor dimnames<-.tensor dimnames.tensor
###   dim<-.tensor
### Keywords: algebra

### ** Examples

A <- to.tensor(1:20,c(U=2,V=2,W=5))
A
dim(A)
names(A)
names(A) <- c("A","B","C")
A
dim(A)
names(A)




