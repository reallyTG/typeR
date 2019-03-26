library(ggridges)


### Name: position_points_sina
### Title: Randomly distribute points in a ridgeline plot between baseline
###   and ridgeline
### Aliases: position_points_sina PositionPointsSina
### Keywords: datasets

### ** Examples

library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(jittered_points = TRUE, position = "points_sina", alpha = 0.7)



