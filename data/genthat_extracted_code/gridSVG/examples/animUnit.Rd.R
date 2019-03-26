library(gridSVG)


### Name: animUnit
### Title: Generate a set of animation values.
### Aliases: animUnit animValue as.animUnit as.animValue
### Keywords: dplot

### ** Examples

require(grid)

animValue(c("visible", "hidden"))
animUnit(unit(1:24, "in"),
         timeid=rep(1:3, each=8),
         id=rep(1:2, 12))



