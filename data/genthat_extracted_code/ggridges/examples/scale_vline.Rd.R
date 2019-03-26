library(ggridges)


### Name: scale_vline
### Title: Scales for vline aesthetics
### Aliases: scale_vline_linetype scale_vline_size_continuous
###   scale_vline_colour_hue scale_vline_color_hue
###   scale_vline_colour_gradient scale_vline_color_gradient
###   scale_vline_linetype_discrete scale_vline_color_discrete
###   scale_vline_colour_discrete scale_vline_color_continuous
###   scale_vline_colour_continuous

### ** Examples

library(ggplot2)

# default scales
ggplot(iris, aes(x=Sepal.Length, y=Species, fill = Species, color = Species)) +
  geom_density_ridges(
    aes(vline_color = Species, vline_linetype = Species),
    alpha = .4, quantile_lines = TRUE
  ) +
  theme_ridges()

# modified scales
ggplot(iris, aes(x=Sepal.Length, y=Species, fill = Species, color = Species)) +
  geom_density_ridges(
    aes(vline_color = Species),
    alpha = .4, quantile_lines = TRUE
  ) +
  scale_fill_hue(l = 50) +
  scale_vline_color_hue(l = 30) +
  theme_ridges()



