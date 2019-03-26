library(jjb)


### Name: circle_matrix
### Title: Create a circle pattern within a matrix
### Aliases: circle_matrix

### ** Examples


# Generate a basic circle matrix
circle_matrix(10, 10, 3, 4, 2)

# Generate two circles within the matrix
circle_matrix(10, 20, c(3,6), c(4,6), c(2,2))

# Different fills
circle_matrix(10, 20, c(3,6), c(4,6), c(2,2), f = c(1,2))



