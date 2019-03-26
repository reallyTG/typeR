library(sazedR)


### Name: sazed
### Title: sazed: A package for for estimating the season length of a
###   seasonal time series.
### Aliases: sazed sazed-package

### ** Examples

season_length <- 26
y <- sin(1:400*2*pi/season_length)
sazed(y)



