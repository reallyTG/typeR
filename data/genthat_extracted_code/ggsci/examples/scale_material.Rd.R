library(ggsci)


### Name: scale_color_material
### Title: Material Design Color Palettes
### Aliases: scale_color_material scale_colour_material scale_fill_material

### ** Examples

library("ggplot2")
library("reshape2")
data("mtcars")

cor = abs(cor(mtcars))
cor_melt = melt(cor)

ggplot(cor_melt,
       aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(colour = "black", size = 0.3) +
  theme_bw() + scale_fill_material("blue-grey")



