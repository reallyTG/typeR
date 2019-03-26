library(marmap)


### Name: plot.buffer
### Title: Plots a circular buffer and or its outline
### Aliases: plot.buffer

### ** Examples

# load and plot a bathymetry
data(florida)
plot(florida, lwd = 0.2)
plot(florida, n = 0, lwd = 0.7, add = TRUE)

# add points around which a buffer will be computed
loc <- data.frame(-80, 26)
points(loc, pch = 19, col = "red")

# compute buffer
buf <- create.buffer(florida, loc, radius=1.5)

# plot buffer bathymetry 
plot(buf, outline=FALSE, n=10, lwd=.5, col=2)

# add buffer outline
plot(buf, lwd=.7, fg=2)



