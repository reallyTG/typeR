library(spatstat.data)


### Name: redwoodfull
### Title: California Redwoods Point Pattern (Entire Dataset)
### Aliases: redwoodfull redwoodfull.extra
### Keywords: datasets spatial

### ** Examples

       data(redwoodfull)
  if(require(spatstat)) {
       plot(redwoodfull)
       redwoodfull.extra$plotit()
       # extract the pattern in region II 
       redwoodII <- redwoodfull[, redwoodfull.extra$regionII]
   }



