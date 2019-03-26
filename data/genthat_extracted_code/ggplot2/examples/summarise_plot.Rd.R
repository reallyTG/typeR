library(ggplot2)


### Name: summarise_plot
### Title: Summarise built plot objects
### Aliases: summarise_plot summarise_layout summarise_coord
###   summarise_layers

### ** Examples

p <- ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~class)
b <- ggplot_build(p)

summarise_layout(b)
summarise_coord(b)
summarise_layers(b)




