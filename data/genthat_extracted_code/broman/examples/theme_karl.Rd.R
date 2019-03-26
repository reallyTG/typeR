library(broman)


### Name: theme_karl
### Title: Karl's ggplot2 theme
### Aliases: theme_karl karl_theme

### ** Examples

library(ggplot2)
mtcars$cyl <- factor(mtcars$cyl)
ggplot(mtcars, aes(y=mpg, x=disp, color=cyl)) +
    geom_point() + theme_karl()




