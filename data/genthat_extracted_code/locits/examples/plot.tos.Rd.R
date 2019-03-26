library(locits)


### Name: plot.tos
### Title: Produces a graphical representation of the results of a test of
###   stationarity contained in a 'tos' object.
### Aliases: plot.tos
### Keywords: ts

### ** Examples

#
# Produces an interesting plot with high probability
#
#
# Note that the input time series is two concatenated white noise
# sequences with very different variances.
#
answer <- hwtos2(c(rnorm(256), rnorm(256, sd=5)))
## Not run: plot(answer)



