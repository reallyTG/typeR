library(harrypotter)


### Name: scale_color_hp
### Title: Harry Potter colour scales
### Aliases: scale_color_hp scale_colour_hp scale_colour_hp_d
###   scale_color_hp_d scale_fill_hp_d scale_fill_hp

### ** Examples

library(ggplot2)



ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +
geom_bar() +
scale_fill_hp(discrete = TRUE, option = "Ravenclaw")

ggplot(mtcars, aes(factor(gear), fill=factor(carb))) +
geom_bar() +
scale_fill_hp(discrete = TRUE, option = "Slytherin")

ggplot(mtcars, aes(x = mpg, y = disp, colour = hp)) +
geom_point(size = 2) +
scale_colour_hp(option = "Gryffindor")







