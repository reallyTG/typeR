library(lemon)


### Name: coord_flex_cart
### Title: Cartesian coordinates with flexible options for drawing axes
### Aliases: coord_flex_cart coord_flex_flip coord_flex_fixed

### ** Examples

library(ggplot2)
# A standard plot
p <- ggplot(mtcars, aes(disp, wt)) +
 geom_point() +
 geom_smooth() + theme(panel.border=element_blank(), axis.line=element_line())

# We desire that left axis does not extend beyond '6'
# and the x-axis is unaffected
p + coord_capped_cart(left='top')

# Specifying 'bottom' caps the axis with at most the length of 'gap'
p + coord_capped_cart(left='top', bottom='none')

# We can specify a ridiculus large 'gap', but the lines will always
# protrude to the outer most ticks.
p + coord_capped_cart(left='top', bottom='none', gap=2)

# We can use 'capped_horizontal' and 'capped_vertical' to specify for
# each axis individually.
p + coord_capped_cart(left='top', bottom=capped_horizontal('none', gap=2))

# At this point we might as well drop using the short-hand and go full on:
p + coord_flex_cart(left=brackets_vertical(), bottom=capped_horizontal('left'))

# Also works with secondary axes:
p + scale_y_continuous(sec.axis=sec_axis(~5*., name='wt times 5')) +
  coord_flex_cart(left=brackets_vertical(), bottom=capped_horizontal('right'),
  right=capped_vertical('both', gap=0.02))


# Supports the usual 'coord_fixed':
p + coord_flex_fixed(ratio=1.2, bottom=capped_horizontal('right'))

# and coord_flip:
p + coord_flex_flip(ylim=c(2,5), bottom=capped_horizontal('right'))



