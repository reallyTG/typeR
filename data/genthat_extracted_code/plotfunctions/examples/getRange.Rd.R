library(plotfunctions)


### Name: getRange
### Title: Function for rounding and/or segmenting a range.
### Aliases: getRange

### ** Examples

zlim <- c(-2.5, 3.01)
# does not change anything:
getRange(zlim)
# create a range of 5 numbers: 
# (basically just using seq )
getRange(zlim, n.seg=5)
# rounds the numbers:
getRange(zlim, dec=0)
getRange(zlim, n.seg=5, dec=0)
# extreme values are multiplications of 5
# that contains zlim values:
getRange(zlim, step=5)
getRange(zlim, step=5, n.seg=5)
# similar, but not the same:
getRange(zlim, n.seg=5, dec=0)
getRange(zlim, n.seg=5, step=1)
# combining:
getRange(zlim, n.seg=5, step=1, dec=0)




