library(LPWC)


### Name: prep.data
### Title: Preparing Data
### Aliases: prep.data

### ** Examples

prep.data(array(rnorm(20), c(5, 4)), c(0, 0, 0, -1, 1),
          timepoints = c(0, 5, 15, 30))
prep.data(array(runif(100, 0, 10), c(10, 10)), sample((-2:2), size = 10, replace = TRUE),
          timepoints = c(0, 5, 15, 30, 45, 60, 75, 80, 100, 120))




