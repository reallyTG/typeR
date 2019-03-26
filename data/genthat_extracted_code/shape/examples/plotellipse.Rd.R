library(shape)


### Name: plotellipse
### Title: adds part of a colored and rotated ellipse to a plot
### Aliases: plotellipse
### Keywords: aplot

### ** Examples

emptyplot(c(-1, 1), main = "plotellipse")
plotellipse(rx = 0.8, ry = 0.3, angle = 60, col = "blue")
plotellipse(rx = 1.0, ry = 0.6, angle = 0, from = pi, to = 2*pi,
            arrow = TRUE, arr.pos = seq(0.1, 0.5, by = 0.1),
            arr.col = rainbow(5))
plotellipse(rx = 1.0, ry = 0.6, angle = 30, from = pi, to = 1.2*pi,
            col = "red")
plotellipse(rx = 0.1, ry = 0.6, from = 1.5*pi, to = pi,
            lcol = "orange", mid = c(0.2,0.2))
plotellipse(rx = 0.1, ry = 0.6, angle = 30, from = 1.5*pi, to = pi,
            lcol = "orange", mid = c(0.2,0.2))



