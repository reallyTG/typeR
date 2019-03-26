library(ggforce)


### Name: facet_zoom
### Title: Facet data for zoom with context
### Aliases: facet_zoom

### ** Examples

# Zoom in on the versicolor species on the x-axis
ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) +
  geom_point() +
  facet_zoom(x = Species == 'versicolor')

# Zoom in on versicolor on both axes
ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) +
  geom_point() +
  facet_zoom(xy = Species == 'versicolor')

# Use different zoom criteria on each axis
ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) +
  geom_point() +
  facet_zoom(x = Species != 'setosa', y = Species == 'versicolor')

# Get each axis zoom separately as well
ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) +
  geom_point() +
  facet_zoom(xy = Species == 'versicolor', split = TRUE)

# Define the zoom area directly
ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) +
  geom_point() +
  facet_zoom(xlim = c(2, 4))

# Selectively show data in the zoom panel
ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) +
  geom_point() +
  facet_zoom(x = Species == 'versicolor', zoom.data = Species == 'versicolor')



