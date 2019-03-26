library(pracma)


### Name: flipdim
### Title: Matrix Flipping (Matlab Style)
### Aliases: flipdim flipud fliplr circshift
### Keywords: manip

### ** Examples

a <- matrix(1:12, nrow=3, ncol=4, byrow=TRUE)
flipud(a)
fliplr(a)

circshift(a, c(1, -1))
v <- 1:10
circshift(v, 5)



