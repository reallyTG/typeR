library(locits)


### Name: lacf
### Title: Compute localized autocovariance.
### Aliases: lacf
### Keywords: ts

### ** Examples

#
# With wavethresh attached, note binwidth is fabricated here,
# just to make the example work. The lacf implementation in
# the costat package performs wavelet (ie maybe better) smoothing automatically
#
v <- lacf(rnorm(256), binwidth=40)
#
# With costat attached also
#
## Not run: plot(v)



