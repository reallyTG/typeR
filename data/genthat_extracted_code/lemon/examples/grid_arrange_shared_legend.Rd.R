library(lemon)


### Name: grid_arrange_shared_legend
### Title: Share a legend between multiple plots
### Aliases: grid_arrange_shared_legend

### ** Examples

library(ggplot2)
dsamp <- diamonds[sample(nrow(diamonds), 300), ]
p1 <- qplot(carat, price, data = dsamp, colour = clarity)
p2 <- qplot(cut, price, data = dsamp, colour = clarity)
p3 <- qplot(color, price, data = dsamp, colour = clarity)
p4 <- qplot(depth, price, data = dsamp, colour = clarity)
grid_arrange_shared_legend(p1, p2, p3, p4, ncol = 4, nrow = 1)
grid_arrange_shared_legend(p1, p2, p3, p4, ncol = 2, nrow = 2)

# Passing on plots in a grob are not touched
grid_arrange_shared_legend(p1, gridExtra::arrangeGrob(p2, p3, p4, ncol=3), ncol=1, nrow=2)

# We can also pass on named arguments to arrangeGrob:
title <- grid::textGrob('This is grob', gp=grid::gpar(fontsize=14, fontface='bold'))
nt <- theme(legend.position='none')
grid_arrange_shared_legend(p1, 
   gridExtra::arrangeGrob(p2+nt, p3+nt, p4+nt, ncol=3), ncol=1, nrow=2, 
   top=title)



