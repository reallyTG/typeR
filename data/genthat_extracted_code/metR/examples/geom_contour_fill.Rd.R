library(metR)


### Name: geom_contour_fill
### Title: Filled 2d contours of a 3d surface
### Aliases: geom_contour_fill stat_contour_fill StatContourFill
### Keywords: datasets

### ** Examples

library(ggplot2)
surface <- reshape2::melt(volcano)
ggplot(surface, aes(Var1, Var2, z = value)) +
  geom_contour_fill() +
  geom_contour(color = "black", size = 0.1)

# If one uses level instead of int.level, one of the small
# contours near the crater disapears
ggplot(surface, aes(Var1, Var2, z = value)) +
  geom_contour_fill(aes(fill = ..level..))




