library(spatstat)


### Name: plot.texturemap
### Title: Plot a Texture Map
### Aliases: plot.texturemap
### Keywords: spatial hplot

### ** Examples

   tm <- texturemap(c("First", "Second", "Third"), 2:4, col=2:4)
   plot(tm, vertical=FALSE)
   ## abbreviate the labels
   plot(tm, labelmap=function(x) substr(x, 1, 2))



