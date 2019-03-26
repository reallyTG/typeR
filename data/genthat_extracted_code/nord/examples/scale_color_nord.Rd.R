library(nord)


### Name: scale_color_nord
### Title: nord color scale for ggplot2
### Aliases: scale_color_nord scale_colour_nord

### ** Examples

library(ggplot2)
library(nord)

ggplot(diamonds) +
 geom_point(aes(x = carat, y = price, color = cut)) +
 scale_color_nord("lumina")




