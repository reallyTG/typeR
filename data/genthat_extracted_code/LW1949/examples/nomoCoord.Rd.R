library(LW1949)


### Name: nomoCoord
### Title: Find the Coordinate from the Scale of a Nomograph
### Aliases: nomoCoord

### ** Examples

scales <- LWnomo1(TRUE)
fromxy <- nomoCoord(scales$scale1r, 34)
toxy <- nomoCoord(scales$scale3, 16^2/(100*34))
segments(fromxy[1], fromxy[2], toxy[1], toxy[2], col="red")




