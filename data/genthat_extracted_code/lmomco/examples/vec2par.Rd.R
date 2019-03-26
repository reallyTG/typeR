library(lmomco)


### Name: vec2par
### Title: Convert a Vector of Parameters to a Parameter Object of a
###   Distribution
### Aliases: vec2par
### Keywords: utility (vector)

### ** Examples

para <- vec2par(c(12,123,0.5),'gev')
Q <- quagev(0.5,para)

my.custom <- vec2par(c(2,2), type='myowndist') # Think about making your own



