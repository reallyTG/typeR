library(paletteer)


### Name: ggplot2-scales-continuous
### Title: Continuous scales to use for ggplot2
### Aliases: ggplot2-scales-continuous scale_colour_paletteer_c
###   scale_color_paletteer_c scale_fill_paletteer_c

### ** Examples


if (require('ggplot2')) {

  ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
    geom_point() +
    scale_colour_paletteer_c(package = "scico", palette = "tokyo")
}




