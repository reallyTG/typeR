library(countcolors)


### Name: sphericalRange
### Title: Find pixels within a target color range defined by a center and
###   search radius
### Aliases: sphericalRange

### ** Examples

# Target color: change all of the red flowers to turquoise
flowers <- jpeg::readJPEG(system.file("extdata", "flowers.jpg", package =
"countcolors"))

# Red:
center <- c(255, 75, 75) / 255

# Setting the radius too low:
red.flowers <- countcolors::sphericalRange(flowers, center = center, radius =
0.05, target.color = "turquoise")

# Setting the radius too high:
red.flowers <- countcolors::sphericalRange(flowers, center = center, radius =
0.4, target.color = "turquoise")

# Setting the radius just right:
red.flowers <- countcolors::sphericalRange(flowers, center = center, radius =
0.2, target.color = "turquoise")




