library(marmap)


### Name: combine.buffers
### Title: Create a new, (non circular) composite buffer from a list of
###   existing buffers.
### Aliases: combine.buffers

### ** Examples

# load and plot a bathymetry
data(florida)
plot(florida, lwd = 0.2)
plot(florida, n = 1, lwd = 0.7, add = TRUE)

# add points around which a buffer will be computed
loc <- data.frame(c(-80,-82), c(26,24))
points(loc, pch = 19, col = "red")

# create 2 distinct buffer objects with different radii
buf1 <- create.buffer(florida, loc[1,], radius=1.9)
buf2 <- create.buffer(florida, loc[2,], radius=1.2)

# combine both buffers
buf <- combine.buffers(buf1,buf2)

## Not run: 
##D # Add outline of the resulting buffer in red 
##D # and the outline of the original buffers in blue
##D plot(outline.buffer(buf), lwd = 3, col = 2, add=TRUE)
##D plot(buf1, lwd = 0.5, fg="blue")
##D plot(buf2, lwd = 0.5, fg="blue")
## End(Not run)



