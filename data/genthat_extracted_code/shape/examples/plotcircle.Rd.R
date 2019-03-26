library(shape)


### Name: plotcircle
### Title: adds part of a colored circle to a plot
### Aliases: plotcircle
### Keywords: aplot

### ** Examples

# symmetrical axes
emptyplot(c(0, 1))
plotcircle(mid = c(0.5, 0.5), r = 0.25, from = 0, to = 3*pi/2,
           arrow = TRUE, arr.pos = 0.5, col = "red")
# symmetrical
plotellipse(mid = c(0.5, 0.5), rx = 0.2, ry = 0.2, 
           arrow = TRUE, arr.pos = 0.5, col = "blue")


#non-symmetrical axes
emptyplot(c(0, 1), c(0, 2), main = "plotcircle", asp = FALSE)
plotcircle(mid = c(0.5, 0.5), r = 0.25, from = 0, to = 3*pi/2,
           arrow = TRUE, arr.pos = 0.5, col = "red")
plotellipse(mid = c(0.5, 0.5), rx = 0.25, ry = 0.25, 
           arrow = TRUE, arr.pos = 0.5, col = "blue")



