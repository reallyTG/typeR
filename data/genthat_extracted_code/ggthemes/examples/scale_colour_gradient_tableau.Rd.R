library(ggthemes)


### Name: scale_colour_gradient_tableau
### Title: Tableau sequential colour scale (continuous)
### Aliases: scale_colour_gradient_tableau scale_fill_gradient_tableau
###   scale_color_gradient_tableau scale_color_continuous_tableau
###   scale_fill_continuous_tableau

### ** Examples

library("ggplot2")

df <- data.frame(
  x = runif(100),
  y = runif(100),
  z1 = rnorm(100),
  z2 = abs(rnorm(100))
)

p <- ggplot(df, aes(x, y)) +
     geom_point(aes(colour = z2)) +
     theme_igray()

palettes <-
  ggthemes_data[["tableau"]][["color-palettes"]][["ordered-sequential"]]
for (palette in head(names(palettes))) {
  print(p + scale_colour_gradient_tableau(palette) +
          ggtitle(palette))
}



