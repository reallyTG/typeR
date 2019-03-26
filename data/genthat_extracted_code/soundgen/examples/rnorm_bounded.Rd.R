library(soundgen)


### Name: rnorm_bounded
### Title: Random draw from a truncated normal distribution
### Aliases: rnorm_bounded
### Keywords: internal

### ** Examples

soundgen:::rnorm_bounded(n = 3, mean = 10, sd = 5, low = 7, high = NULL,
  roundToInteger = c(TRUE, FALSE, FALSE))
soundgen:::rnorm_bounded(n = 9, mean = c(10, 50, 100), sd = c(5, 0, 20),
  roundToInteger = TRUE) # vectorized
# in case of conflicts between mean and bounds, either adjust the mean:
soundgen:::rnorm_bounded(n = 3, mean = 10, sd = .1,
  low = c(15, 0, 0), high = c(100, 100, 8), invalidArgAction = 'adjust')
#... or ignore the boundaries
soundgen:::rnorm_bounded(n = 3, mean = 10, sd = .1,
  low = c(15, 0, 0), high = c(100, 100, 8), invalidArgAction = 'ignore')



