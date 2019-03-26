library(Ecfun)


### Name: Arrows
### Title: Draw arrows between pairs of points.
### Aliases: Arrows
### Keywords: aplot

### ** Examples

##
## 1. Simple example: 
##    3 arrows, the first with length 0 is suppressed 
##
plot(1:3, type='n')
Arrows(1, 1, c(1, 2, 2), c(1, 2:3), col=1:3, length=c(1, .2, .6))

##
## 2.  with an NA
##
plot(1:3, type='n')
Arrows(1, 1, c(1, 2, 2), c(1, 2, NA), col=1:3, length=c(1, .2, .6))




