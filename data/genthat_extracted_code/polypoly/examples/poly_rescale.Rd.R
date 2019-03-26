library(polypoly)


### Name: poly_rescale
### Title: Rescale the range of a polynomial matrix
### Aliases: poly_rescale

### ** Examples

m <- poly(1:10, degree = 4)

# Difference between min and max values of first column is 10
scaled <- poly_rescale(m, scale_width = 10)
scaled

# Rescaled values are still orthogonal
zapsmall(cor(scaled))



