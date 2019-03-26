library(LS2W)


### Name: D2Amat
### Title: Creates the A matrix required for analysing LS2W processes.
### Aliases: D2Amat
### Keywords: models

### ** Examples

#
# Let's compute the A matrix for the Haar wavelet in 2-D.
#
D2Amat(J=-2, filter.number=1, family="DaubExPhase", switch="direction")
#       1      2      3      4      5      6
#1 2.2500 1.3125 0.2500 0.3125 0.7500 0.9375
#2 1.3125 4.8125 0.3125 0.5625 0.1875 1.3125
#3 0.2500 0.3125 2.2500 1.3125 0.7500 0.9375
#4 0.3125 0.5625 1.3125 4.8125 0.1875 1.3125
#5 0.7500 0.1875 0.7500 0.1875 2.2500 0.5625
#6 0.9375 1.3125 0.9375 1.3125 0.5625 3.0625
#
# And now for the same matrix structured by level
#
D2Amat(J=-2, filter.number=1, family="DaubExPhase", switch="level")
#       1      2      3      4      5      6
#1 2.2500 0.2500 0.7500 1.3125 0.3125 0.9375
#2 0.2500 2.2500 0.7500 0.3125 1.3125 0.9375
#3 0.7500 0.7500 2.2500 0.1875 0.1875 0.5625
#4 1.3125 0.3125 0.1875 4.8125 0.5625 1.3125
#5 0.3125 1.3125 0.1875 0.5625 4.8125 1.3125
#6 0.9375 0.9375 0.5625 1.3125 1.3125 3.0625



