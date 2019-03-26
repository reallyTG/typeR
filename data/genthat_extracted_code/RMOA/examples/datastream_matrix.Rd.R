library(RMOA)


### Name: datastream_matrix
### Title: data streams on a matrix
### Aliases: datastream_matrix

### ** Examples

data <- matrix(rnorm(1000*10), nrow = 1000, ncol = 10)
x <- datastream_matrix(data=data)
x$get_points(10)
x
x$get_points(10)
x



