library(lemon)


### Name: brackets_horizontal
### Title: Axis brackets instead of axis ticks and lines
### Aliases: brackets_horizontal brackets_horisontal brackets_vertical

### ** Examples

library(ggplot2)
p <- ggplot(mpg, aes(as.factor(cyl), hwy, colour=class)) +
  geom_point(position=position_jitter(width=0.3)) +
  theme_bw() +
  theme(panel.border = element_blank(), axis.line = element_line())
p

p <- p + coord_flex_cart(bottom=brackets_horizontal(length=unit(0.08, 'npc')))
p
# However getting the correct width is a matter of tweaking either length or
# position_jitter...

# A further adjustment,
p + theme(panel.grid.major.x = element_blank())



