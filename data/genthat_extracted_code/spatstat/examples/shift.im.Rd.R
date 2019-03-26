library(spatstat)


### Name: shift.im
### Title: Apply Vector Translation To Pixel Image
### Aliases: shift.im
### Keywords: spatial manip

### ** Examples

 # make up an image
 X <- setcov(unit.square())
 plot(X)

 Y <- shift(X, c(10,10))
 plot(Y)
 # no discernible difference except coordinates are different

 shift(X, origin="mid")



