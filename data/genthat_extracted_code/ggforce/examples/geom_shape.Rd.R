library(ggforce)


### Name: geom_shape
### Title: Draw polygons with expansion/contraction and/or rounded corners
### Aliases: geom_shape

### ** Examples

shape <- data.frame(
  x = c(0.5, 1, 0.75, 0.25, 0),
  y = c(0, 0.5, 1, 0.75, 0.25)
)
# Expand and round
ggplot(shape, aes(x = x, y = y)) +
  geom_shape(expand = unit(1, 'cm'), radius = unit(0.5, 'cm')) +
  geom_polygon(fill = 'red')

# Contract
ggplot(shape, aes(x = x, y = y)) +
  geom_polygon(fill = 'red') +
  geom_shape(expand = unit(-1, 'cm'))

# Only round corners
ggplot(shape, aes(x = x, y = y)) +
  geom_polygon(fill = 'red') +
  geom_shape(radius = unit(1, 'cm'))



