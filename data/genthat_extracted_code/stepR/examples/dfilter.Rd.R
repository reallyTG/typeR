library(stepR)


### Name: dfilter
### Title: Digital filters
### Aliases: dfilter print.dfilter
### Keywords: ts

### ** Examples

# 6-pole Bessel filter with cut-off frequency 1 / 100, with length 100 (too short!)
dfilter("bessel", list(pole = 6, cutoff = 1 / 100), 100)
# custom filter: running mean of length 3
dfilter("custom", rep(1, 3))
dfilter("custom", rep(1, 3))$kern # normalised!
dfilter("custom", rep(1, 3))$step
# Gaussian filter with bandwidth 3 and length 11 (from -5 to 5)
dfilter("gauss", 3, 11)



