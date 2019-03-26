library(nima)


### Name: theme_nima
### Title: Nima's ggplot2 theme
### Aliases: theme_nima nima_theme

### ** Examples

library(ggplot2)
p <- ggplot(mtcars, aes(y = mpg, x = disp, color = factor(cyl)))
p <- p + geom_point() + scale_fill_nima() + scale_color_nima() + theme_nima()
p




