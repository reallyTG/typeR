library(smacpod)


### Name: circles.intersect
### Title: Determine whether circles intersect
### Aliases: circles.intersect

### ** Examples

# first two circles intersect each other, 
# the next two circles intersect each other 
# (but not the previous ones)
# the last circles doesn't intersect any other circle
co = cbind(c(1, 2, 5, 6, 9), c(1, 2, 5, 6, 9))
r = c(1.25, 1.25, 1.25, 1.25, 1.25)
# draw circles
circles.plot(co, r)
# confirm intersections
circles.intersect(co, r)

# nested circles (don't intersect)
co = matrix(rep(0, 4), nrow = 2)
r = c(1, 1.5)
circles.plot(co, r)
circles.intersect(co, r)



