library(Boom)


### Name: thin
### Title: Thin the rows of a matrix
### Aliases: thin
### Keywords: dplot

### ** Examples


x <- rnorm(100)
thin(x, 10)
# returns a 10 vector

y <- matrix(rnorm(200), ncol=2)
thin(y, 10)
# returns a 10 by 2 matrix




