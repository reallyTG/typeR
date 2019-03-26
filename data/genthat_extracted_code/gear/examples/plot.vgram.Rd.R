library(gear)


### Name: plot.vgram
### Title: Plot vgram object
### Aliases: plot.vgram

### ** Examples

data(co)
v = vgram(Al ~ 1, co, ~ easting + northing)
plot(v)
v2 = vgram(Al ~ 1, co, ~ easting + northing, angle = 22.5, ndir = 4)
plot(v2)
# show how attributes can be changed using different arguments
# available in \code{lattice::xyplot}.
plot(v2, col = 2:5)
plot(v2, col = 2:5, pch = 1:4)
plot(v2, col = 2:5, pch = 1:4, lty = 2:5, type = "b")
plot(v2, col = 2:5, pch = 1:4, lty = 2:5, type = "b", 
 key=list(text=list(levels(as.factor(v2$semi$angle))), 
 space='right', points=list(pch=1:4, col=2:5), 
 lines=list(col=2:5, lty = 2:5)))
plot(v2, split = TRUE)



