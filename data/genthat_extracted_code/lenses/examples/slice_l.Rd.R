library(lenses)


### Name: slice_l
### Title: Slice lens
### Aliases: slice_l

### ** Examples

(x <- matrix(1:4, ncol = 2))
view(x, slice_l(1, 2)) # x[2,, drop = FALSE]
view(x, slice_l(2, 2)) # x[,2, drop = FALSE]
set(x, slice_l(1,1), c(10,20))



