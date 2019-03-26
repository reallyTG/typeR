library(fda)


### Name: exponpen
### Title: Exponential Penalty Matrix
### Aliases: exponpen
### Keywords: smooth

### ** Examples


#  set up an exponential basis with 3 basis functions
ratevec  <- c(0, -1, -5)
basisobj <- create.exponential.basis(c(0,1),3,ratevec)
#  compute the 3 by 3 matrix of inner products of
#  second derivatives
penmat <- exponpen(basisobj)




