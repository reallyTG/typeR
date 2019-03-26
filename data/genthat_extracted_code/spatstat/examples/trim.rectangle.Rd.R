library(spatstat)


### Name: trim.rectangle
### Title: Cut margins from rectangle
### Aliases: trim.rectangle
### Keywords: spatial manip

### ** Examples

  w <- square(10)
  # trim a margin of width 1 from all four sides
  square9 <- trim.rectangle(w, 1)

  # trim margin of width 3 from the right side
  # and margin of height 4 from top edge.
  v <- trim.rectangle(w, c(0,3), c(0,4))



