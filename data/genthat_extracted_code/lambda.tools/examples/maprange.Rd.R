library(lambda.tools)


### Name: maprange
### Title: Apply a function over a rolling range of a data structure
### Aliases: maprange

### ** Examples

# Compute a 5-period moving average over a vector
maprange(rnorm(20), 5, mean, do.pad=TRUE)

# Same as above, but do it for 4 time series
maprange(matrix(rnorm(80),ncol=4), 5, mean, do.pad=TRUE)



