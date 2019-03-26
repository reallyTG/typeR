library(lemon)


### Name: coord_capped_cart
### Title: Cartesian coordinates with capped axis lines.
### Aliases: coord_capped_cart capped_horisontal coord_capped_flip
###   capped_horizontal capped_vertical

### ** Examples

library(ggplot2)
# Notice how the axis lines of the following plot meet in the lower-left corner.
p <- ggplot(mtcars, aes(x = mpg)) + geom_dotplot() +
  theme_bw() +
  theme(panel.border=element_blank(), axis.line=element_line())
p

# We can introduce a gap by capping the ends:
p + coord_capped_cart(bottom='none', left='none')

# The lower limit on the y-axis is 0. We can cap the line to this value.
# Notice how the x-axis line extends through the plot when we no long
# define its capping.
p + coord_capped_cart(left='both')

# It it also works on the flipped.
p + coord_capped_flip(bottom='both')

# And on secondary axis, in conjuction with brackets:
p +
  scale_y_continuous(sec.axis = sec_axis(~.*100)) +
  scale_x_continuous(sec.axis = sec_axis(~1/., name='Madness scale')) +
  coord_capped_cart(bottom='none', left='none', right='both', top=brackets_horizontal())
# Although we cannot recommend the above madness.



