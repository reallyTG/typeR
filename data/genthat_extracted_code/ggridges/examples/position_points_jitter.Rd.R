library(ggridges)


### Name: position_points_jitter
### Title: Randomly jitter the points in a ridgeline plot
### Aliases: position_points_jitter PositionPointsJitter
### Keywords: datasets

### ** Examples

library(ggplot2)

# default jittered points
ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(jittered_points = TRUE, position = "points_jitter", alpha = 0.7)

# simulating a rug
ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(jittered_points = TRUE, point_shape = '|', alpha = 0.7, point_size = 2,
                      position = position_points_jitter(width = 0.02, height = 0))



