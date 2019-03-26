library(spatstat)


### Name: grow.boxx
### Title: Add margins to box in any dimension
### Aliases: grow.boxx grow.box3
### Keywords: spatial manip

### ** Examples

  w <- boxx(c(0,10), c(0,10), c(0,10), c(0,10))
  # add a margin of size 1 on both sides in all four dimensions
  b12 <- grow.boxx(w, 1)

  # add margin of size 2 at left, and margin of size 3 at right,
  # in each dimension.
  v <- grow.boxx(w, 2, 3)



