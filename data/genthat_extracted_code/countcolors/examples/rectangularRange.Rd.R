library(countcolors)


### Name: rectangularRange
### Title: Find pixels within a target color range defined by boundaries in
###   each channel
### Aliases: rectangularRange

### ** Examples

flowers <- jpeg::readJPEG(system.file("extdata", "flowers.jpg", package =
"countcolors"))

# Define upper and lower bounds for white
lower <- rep(0.8, 3)
upper <- rep(1, 3)

white.flowers <- countcolors::rectangularRange(flowers, rep(1, 3), rep(0.85,
3), target.color = "turquoise")




