library(soundgen)


### Name: interpolMatrix
### Title: Interpolate matrix
### Aliases: interpolMatrix
### Keywords: internal

### ** Examples

m = matrix(1:12 + rnorm(12, 0, .2), nrow = 3)
soundgen:::interpolMatrix(m)  # just returns the original
soundgen:::interpolMatrix(m, nr = 10, nc = 7)
soundgen:::interpolMatrix(m, nr = 10, nc = 7, interpol = 'spline')
soundgen:::interpolMatrix(m, nr = 2, nc = 7)
soundgen:::interpolMatrix(m, nr = 2, nc = 2)

# input matrices can have a single row/column
soundgen:::interpolMatrix(matrix(1:5, nrow = 1), nc = 9)
soundgen:::interpolMatrix(matrix(1:5, ncol = 1), nr = 5, nc = 3)



