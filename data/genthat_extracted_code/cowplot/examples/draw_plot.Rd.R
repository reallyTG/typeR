library(cowplot)


### Name: draw_plot
### Title: Draw a (sub)plot.
### Aliases: draw_plot

### ** Examples

# make a plot
p <- qplot(1:10, 1:10)
# draw into the top-right corner of a larger plot area
ggdraw() + draw_plot(p, .6, .6, .4, .4)



