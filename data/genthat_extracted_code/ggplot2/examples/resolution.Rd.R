library(ggplot2)


### Name: resolution
### Title: Compute the "resolution" of a numeric vector
### Aliases: resolution

### ** Examples

resolution(1:10)
resolution((1:10) - 0.5)
resolution((1:10) - 0.5, FALSE)

# Note the difference between numeric and integer vectors
resolution(c(2, 10, 20, 50))
resolution(c(2L, 10L, 20L, 50L))



