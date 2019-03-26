library(lenses)


### Name: lower_tri_l
### Title: Lens into lower diagonal elements
### Aliases: lower_tri_l

### ** Examples

(x <- matrix(1:9, ncol = 3))
view(x, lower_tri_l())
view(x, lower_tri_l(diag = TRUE))
set(x, lower_tri_l(), c(100, 200, 300))



