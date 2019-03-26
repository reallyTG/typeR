library(oaPlots)


### Name: splitCircle
### Title: Function for drawing a split circle (two differently colored
###   semicircles)
### Aliases: splitCircle

### ** Examples

plot(-1, -1, xlim = c(0, 1), ylim = c(0,1), type = "n")
splitCircle(x = 0.5, y = 0.5, radius = 0.48,
		splitAngle = pi/4, nv = 1000, border = NA,
		col1 = "blue", col2 = "red")



