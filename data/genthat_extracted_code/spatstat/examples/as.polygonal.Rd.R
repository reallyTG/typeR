library(spatstat)


### Name: as.polygonal
### Title: Convert a Window to a Polygonal Window
### Aliases: as.polygonal
### Keywords: spatial manip

### ** Examples

   data(letterR)
   m <- as.mask(letterR, dimyx=32)
   p <- as.polygonal(m)
   if(interactive()) {
      plot(m)
      plot(p, add=TRUE, lwd=2)
   }



