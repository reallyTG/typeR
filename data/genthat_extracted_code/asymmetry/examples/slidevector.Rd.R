library(asymmetry)


### Name: slidevector
### Title: The slide-vector model
### Aliases: slidevector
### Keywords: MDS

### ** Examples

## asymmetric distances between English towns
data(Englishtowns)
v <- slidevector(Englishtowns, ndim = 2, itmax = 250, eps = .001)
plot(v)



