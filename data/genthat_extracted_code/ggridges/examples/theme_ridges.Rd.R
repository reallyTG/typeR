library(ggridges)


### Name: theme_ridges
### Title: A custom theme specifically for use with ridgeline plots
### Aliases: theme_ridges

### ** Examples

library(ggplot2)

# Example with background grid
ggplot(iris, aes(x = Sepal.Length, y = Species, group = Species)) +
  geom_density_ridges(rel_min_height = 0.005) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_x_continuous(expand = c(0.01, 0)) +
  theme_ridges()

# Example without background grid
ggplot(iris, aes(x = Sepal.Length, y = Species, group = Species)) +
  geom_density_ridges() +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_x_continuous(expand = c(0.01, 0)) +
  theme_ridges(grid = FALSE)




