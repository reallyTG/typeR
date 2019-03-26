library(ggvis)


### Name: resolution
### Title: Compute the "resolution" of a data vector.
### Aliases: resolution

### ** Examples

resolution(1:10)
resolution((1:10) - 0.5)
resolution((1:10) - 0.5, FALSE)
resolution(c(1,2, 10, 20, 50))
resolution(as.integer(c(1, 10, 20, 50)))  # Returns 1



