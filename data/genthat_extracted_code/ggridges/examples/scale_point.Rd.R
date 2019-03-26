library(ggridges)


### Name: scale_point
### Title: Scales for point aesthetics
### Aliases: scale_point_shape scale_point_size_continuous
###   scale_point_colour_hue scale_point_color_hue scale_point_fill_hue
###   scale_point_colour_gradient scale_point_color_gradient
###   scale_point_fill_gradient scale_point_shape_discrete
###   scale_point_color_discrete scale_point_colour_discrete
###   scale_point_fill_discrete scale_point_color_continuous
###   scale_point_colour_continuous scale_point_fill_continuous

### ** Examples

library(ggplot2)

# default scales
ggplot(iris, aes(x=Sepal.Length, y=Species, fill = Species)) +
  geom_density_ridges(
    aes(
      point_color = Species, point_fill = Species,
      point_shape = Species
    ),
    alpha = .4, jittered_points = TRUE
  ) +
  theme_ridges()

# modified scales
ggplot(iris, aes(x=Sepal.Length, y=Species, fill = Species)) +
  geom_density_ridges(
    aes(
      point_color = Species, point_fill = Species,
      point_shape = Species
    ),
    alpha = .4, point_alpha = 1,
    jittered_points = TRUE
  ) +
  scale_fill_hue(l = 50) +
  scale_point_color_hue(l = 20) +
  scale_point_fill_hue(l = 70) +
  scale_discrete_manual("point_shape", values = c(21, 22, 23)) +
  theme_ridges()



