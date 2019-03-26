library(plotrix)


### Name: get.triprop
### Title: Enter three proportion data - usually soil textures
### Aliases: get.triprop
### Keywords: misc

### ** Examples

 if(dev.interactive()) {
  # get some proportions
  newsp<-get.triprop()
  # show the triangle
  triax.frame(main="Test triax.plot")
  # now plot the observations
  triax.points(newsp)
 }



