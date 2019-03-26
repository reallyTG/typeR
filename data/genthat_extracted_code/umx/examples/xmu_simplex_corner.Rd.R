library(umx)


### Name: xmu_simplex_corner
### Title: Internal function to help building simplex models
### Aliases: xmu_simplex_corner

### ** Examples

x = umxMatrix('test', 'Full', nrow = 4, ncol = 4)
xmu_simplex_corner(x, start = .9)
# See how we have a diag free, but offset 1-down?
umx_print( xmu_simplex_corner(x, start = .9)$values, zero=".")



