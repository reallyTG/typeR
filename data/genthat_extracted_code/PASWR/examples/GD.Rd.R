library(PASWR)


### Name: GD
### Title: Times Until Failure
### Aliases: GD
### Keywords: datasets

### ** Examples

with(data = GD, 
hist(attf,prob=TRUE))
with(data = GD, 
lines(density(attf)))
# Trellis Approach
histogram(~attf, data = GD, type="density",
panel = function(x, ...) {
panel.histogram(x, ...)
panel.densityplot(x, col = "blue", plot.points=TRUE, lwd=2)
} )



