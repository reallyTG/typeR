library(countcolors)


### Name: plotArrayAsImage
### Title: Plot a 3D array as an RGB image
### Aliases: plotArrayAsImage

### ** Examples

# Read in image
flowers <- jpeg::readJPEG(system.file("extdata", "flowers.jpg", package =
"countcolors"))

# Plot
plotArrayAsImage(flowers, main = "flowers!")




