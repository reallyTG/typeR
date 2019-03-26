library(egcm)


### Name: detrend
### Title: Remove a linear trend from a vector
### Aliases: detrend

### ** Examples

detrend(rep(1,10))  # == 0 0 0 0 0 0 0 0 0 0
detrend(1:10)       # == 0 0 0 0 0 0 0 0 0 0
detrend((1:10)^2)   # == 12  4 -2 -6 -8 -8 -6 -2  4 12

mean(detrend(rnorm(1:100) + 1:100))  # should be very close to 0
sd(rnorm(1:100) + 1:100)             # approximately 29
sd(detrend(rnorm(1:100) + 1:100))    # approximately 1



