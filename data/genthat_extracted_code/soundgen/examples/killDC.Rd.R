library(soundgen)


### Name: killDC
### Title: Kill DC
### Aliases: killDC
### Keywords: internal

### ** Examples

# remove static DC offset
a = rnorm(500) + .3
b = soundgen:::killDC(a, windowLength_points = 500, plot = TRUE)

# remove trend
a = rnorm(500) + seq(0, 1, length.out = 500)
b = soundgen:::killDC(a, windowLength_points = 100, plot = TRUE)

# can also be used as a high-pass filter
a = rnorm(500) + sin(1:500 / 50)
b = soundgen:::killDC(a, windowLength_points = 25, plot = TRUE)



