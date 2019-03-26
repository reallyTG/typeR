library(dcemriS4)


### Name: findCenter
### Title: Find the Center of a Binary Mask
### Aliases: findCenter
### Keywords: misc

### ** Examples

M <- array(FALSE, rep(10,3))
M[6:10,6:10,6:10] <- TRUE
Mc <- findCenter(M)
print(Mc)



