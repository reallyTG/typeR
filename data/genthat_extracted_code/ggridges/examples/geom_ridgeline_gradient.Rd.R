library(ggridges)


### Name: geom_ridgeline_gradient
### Title: Plot ridgelines and ridgeline plots with fill gradients along
###   the x axis
### Aliases: geom_ridgeline_gradient GeomRidgelineGradient
###   geom_density_ridges_gradient GeomDensityRidgesGradient
### Keywords: datasets

### ** Examples

library(ggplot2)

# Example for `geom_ridgeline_gradient()`
library(viridis)
d <- data.frame(x = rep(1:5, 3) + c(rep(0, 5), rep(0.3, 5), rep(0.6, 5)),
                y = c(rep(0, 5), rep(1, 5), rep(3, 5)),
                height = c(0, 1, 3, 4, 0, 1, 2, 3, 5, 4, 0, 5, 4, 4, 1))
ggplot(d, aes(x, y, height = height, group = y, fill = factor(x+y))) +
  geom_ridgeline_gradient() +
  scale_fill_viridis(discrete = TRUE, direction = -1) +
  theme(legend.position = 'none')

# Example for `geom_density_ridges_gradient()`
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_x_continuous(expand = c(0.01, 0)) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  theme_ridges(font_size = 13, grid = TRUE) + theme(axis.title.y = element_blank())



