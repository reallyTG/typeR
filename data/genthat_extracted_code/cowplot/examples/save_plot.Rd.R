library(cowplot)


### Name: save_plot
### Title: Alternative to ggsave, with better support for multi-figure
###   plots.
### Aliases: save_plot

### ** Examples

# save a single plot without legend
x <- (1:100)/10
p1 <- qplot(x, 2*x+5, geom='line')
save_plot("p1.pdf", p1)
# now combine with a second plot and save
p2B <- qplot(x, -x^2+10*x-3, geom='line')
p2 <- plot_grid(p1, p2B, labels=c("A", "B"))
save_plot("p2.pdf", p2, ncol = 2)
# save a single plot with legend, changing the aspect ratio to make room for the legend
p3 <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) + geom_point(size=2.5)
save_plot("p3.png", p3, base_aspect_ratio = 1.3)
# same as p3 but determine base_height given base_aspect_ratio and base_width
p4 <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) + geom_point(size=2.5)
save_plot("p4.png", p4, base_height = NULL, base_aspect_ratio = 1.618, base_width = 6)
# same as p4 but determine base_width given base_aspect_ratio and base_height
p5 <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) + geom_point(size=2.5)
save_plot("p5.png", p5, base_height = 6, base_aspect_ratio = 1.618, base_width = NULL)



