library(gameofthrones)


### Name: scale_color_got
### Title: Game of Thrones colour scales
### Aliases: scale_color_got scale_colour_got scale_colour_got_d
###   scale_color_got_d scale_fill_got scale_fill_got_d

### ** Examples

library(ggplot2)

ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +
geom_bar() +
scale_fill_got(discrete = TRUE, option = "Daenerys")

ggplot(mtcars, aes(factor(gear), fill=factor(carb))) +
geom_bar() +
scale_fill_got(discrete = TRUE, option = "Tully")

ggplot(mtcars, aes(x = mpg, y = disp, colour = hp)) +
geom_point(size = 2) +
scale_colour_got(option = "Lannister")





