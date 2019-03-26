library(ggdark)


### Name: invert_geom_defaults
### Title: Invert geom defaults for fill and color/colour
### Aliases: invert_geom_defaults

### ** Examples

library(ggplot2)

p <- ggplot(iris, aes(Sepal.Width, Sepal.Length)) +
  geom_point() +
  facet_wrap(~ Species)

p + dark_theme_gray()  # geom defaults changed

p + theme_gray()  # oh no! geoms are not visible on light background

invert_geom_defaults()  # geom defaults changed back

p + theme_gray() # back to normal



