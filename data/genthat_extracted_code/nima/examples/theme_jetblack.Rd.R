library(nima)


### Name: theme_jetblack
### Title: A jet black ggplot2 theme with inverted colors
### Aliases: theme_jetblack

### ** Examples

library(ggplot2)
p <- ggplot(mtcars, aes(y = mpg, x = disp, color = factor(cyl)))
p <- p + geom_point() + theme_jetblack()
p




