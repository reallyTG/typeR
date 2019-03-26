library(LPTime)


### Name: LPiTrack
### Title: Algorithm for eye-movement signal processing
### Aliases: LPiTrack
### Keywords: nonparametric ts robust

### ** Examples

library(LPTime)
data(EyeTrack.sample)
head(LPiTrack(as.matrix(EyeTrack.sample), m = c(4,5, 15), p=3))



