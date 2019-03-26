library(cowplot)


### Name: draw_grob
### Title: Draw a grob.
### Aliases: draw_grob GeomDrawGrob
### Keywords: datasets

### ** Examples

# A grid grob (here a blue circle)
library(grid)
g <- circleGrob(gp = gpar(fill = "blue"))
# place into the middle of the plotting area, at a scale of 50%
ggdraw() + draw_grob(g, scale = 0.5)



