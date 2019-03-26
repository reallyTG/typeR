library(rgl)


### Name: rgl.pixels
### Title: Extract pixel information from window
### Aliases: rgl.pixels
### Keywords: dynamic

### ** Examples

example(surface3d)
depth <- rgl.pixels(component = "depth")
if (length(depth) && is.matrix(depth)) # Protect against empty or single pixel windows
    contour(depth)



