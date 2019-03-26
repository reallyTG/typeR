library(spatstat)


### Name: rescale.psp
### Title: Convert Line Segment Pattern to Another Unit of Length
### Aliases: rescale.psp
### Keywords: spatial math

### ** Examples

   data(copper)
   X <- copper$Lines
   X
   # data are in km
   # convert to metres
   rescale(X, 1/1000)

   # convert data and rename unit
   rescale(X, 1/1000, c("metre", "metres"))



