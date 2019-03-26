library(spatstat)


### Name: idw
### Title: Inverse-distance weighted smoothing of observations at irregular
###   points
### Aliases: idw
### Keywords: spatial methods smooth

### ** Examples

   # data frame of marks: trees marked by diameter and height
   data(finpines)
   plot(idw(finpines))
   idw(finpines, at="points")[1:5,]



