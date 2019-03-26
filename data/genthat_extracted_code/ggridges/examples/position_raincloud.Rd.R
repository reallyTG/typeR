library(ggridges)


### Name: position_raincloud
### Title: Create a cloud of randomly jittered points below a ridgeline
###   plot
### Aliases: position_raincloud PositionRaincloud
### Keywords: datasets

### ** Examples

library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(jittered_points = TRUE, position = "raincloud", alpha = 0.7)



