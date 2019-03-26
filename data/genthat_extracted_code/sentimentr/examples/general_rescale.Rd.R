library(sentimentr)


### Name: general_rescale
### Title: Rescale a Numeric Vector
### Aliases: general_rescale

### ** Examples


general_rescale(c(1, 0, -1))
general_rescale(c(1, 0, -1, 1.4, -2))
general_rescale(c(1, 0, -1, 1.4, -2), lower = 0, upper = 1)
general_rescale(c(NA, -4:3))
general_rescale(c(NA, -4:3), keep.zero = FALSE)
general_rescale(c(NA, -4:3), keep.zero = FALSE, lower = 0, upper = 100)

## mute extreme values
set.seed(10)
x <- sort(c(NA, -100, -10, 0, rnorm(10, 0, .1), 10, 100), na.last = FALSE)
general_rescale(x)
general_rescale(x, mute = 5)
general_rescale(x, mute = 10)
general_rescale(x, mute = 100)



