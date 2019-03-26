library(paletteer)


### Name: scale_colour_paletteer_d
### Title: Discrete scales to use for ggplot2
### Aliases: scale_colour_paletteer_d scale_color_paletteer_d
###   scale_fill_paletteer_d

### ** Examples


if (require('ggplot2')) {

  ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
    geom_point() +
    scale_colour_paletteer_d(package = "nord", palette = "frost")
}




