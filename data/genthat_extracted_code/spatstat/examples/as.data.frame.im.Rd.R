library(spatstat)


### Name: as.data.frame.im
### Title: Convert Pixel Image to Data Frame
### Aliases: as.data.frame.im
### Keywords: spatial methods

### ** Examples

   # artificial image
   Z <- setcov(square(1))

   Y <- as.data.frame(Z)

   head(Y)



