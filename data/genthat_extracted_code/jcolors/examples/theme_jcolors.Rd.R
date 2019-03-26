library(jcolors)


### Name: theme_dark_bg
### Title: minimal theme for dark backgrounds
### Aliases: theme_dark_bg theme_light_bg

### ** Examples

library(ggplot2)

p <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg,
         colour = factor(gear))) + facet_grid(vs~am)
p + theme_dark_bg()


p <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg,
         colour = factor(gear))) + facet_grid(vs~am)
p + theme_light_bg()




