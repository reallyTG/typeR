library(munsell)


### Name: plot_mnsl
### Title: Plot a munsell colour
### Aliases: plot_mnsl

### ** Examples

plot_mnsl("5R 5/6")
plot_mnsl("5R 5/6",  back.col = "grey40")
p <- plot_mnsl(c("5R 6/6", "5Y 6/6", "5G 6/6", "5B 6/6", "5P 6/6"),
 back.col = "grey40")
p
# returned object is a ggplot object so we can alter the layout
summary(p)
p + ggplot2::facet_wrap(~ num, nrow = 1)



