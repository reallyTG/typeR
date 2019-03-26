library(marmap)


### Name: create.buffer
### Title: Create a buffer of specified radius around one or several points
### Aliases: create.buffer print.buffer

### ** Examples

# load and plot a bathymetry
data(florida)
plot(florida, lwd = 0.2)
plot(florida, n = 1, lwd = 0.7, add = TRUE)

# add a point around which a buffer will be created
loc <- data.frame(-80, 26)
points(loc, pch = 19, col = "red")

# compute and print buffer
buf <- create.buffer(florida, loc, radius=1.5)
buf

# highlight isobath with the buffer and add outline
plot(buf, outline=FALSE, n = 10, col = 2, lwd=.4)
plot(buf, lwd = 0.7, fg = 2)



