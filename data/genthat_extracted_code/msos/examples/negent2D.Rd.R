library(msos)


### Name: negent2D
### Title: Maximizing negentropy for q = 2 dimensions
### Aliases: negent2D

### ** Examples

# Load iris data
data(iris)

# Centers and scales the variables.
y <- scale(as.matrix(iris[, 1:2]))

# Obtains Negent Vectors for 2 x 2 matrix
gstar <- negent2D(y, m = 10)$vectors



