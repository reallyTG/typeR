library(LPTime)


### Name: LPTime
### Title: Fits Vector Autoregressive model on LP transformed time series
###   data
### Aliases: LPTime
### Keywords: multivariate ts robust

### ** Examples

library(LPTime)
data(EyeTrack.sample)
head( LPTime(EyeTrack.sample, m = 2, p = 2))




