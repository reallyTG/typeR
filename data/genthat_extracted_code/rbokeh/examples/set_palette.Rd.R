library(rbokeh)


### Name: set_palette
### Title: Set palettes for various plot attributes
### Aliases: set_palette

### ** Examples

figure() %>%
  ly_points(Sepal.Length, Sepal.Width, data = iris,
    color = Species, glyph = Species) %>%
  set_palette(discrete_color = pal_color(c("red", "blue", "green")))




