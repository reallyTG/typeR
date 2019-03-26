library(coda.base)


### Name: clr_basis
### Title: Centered log-ratio basis
### Aliases: clr_basis

### ** Examples

(B <- clr_basis(5))
# CLR coordinates are linearly dependant coordinates.
(clr_coordinates <- coordinates(c(1,2,3,4,5), B))
# The sum of all coordinates equal to zero
sum(clr_coordinates) < 1e-15



