library(spatstat)


### Name: grow.rectangle
### Title: Add margins to rectangle
### Aliases: grow.rectangle
### Keywords: spatial manip

### ** Examples

  w <- square(10)
  # add a margin of width 1 on all four sides
  square12 <- grow.rectangle(w, 1)

  # add margin of width 3 on the right side
  # and margin of height 4 on top.
  v <- grow.rectangle(w, c(0,3), c(0,4))

  # grow by 5 percent on all sides
  grow.rectangle(w, fraction=0.05)



