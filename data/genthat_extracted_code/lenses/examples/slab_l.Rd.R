library(lenses)


### Name: slab_l
### Title: Slab lens
### Aliases: slab_l

### ** Examples

(x <- matrix(1:4, ncol = 2))
view(x, slab_l(2,)) # x[2,, drop = FALSE]
view(x, slab_l(2, 2)) # x[2,2, drop = FALSE]
set(x, slab_l(1,1:2), c(10,20))



