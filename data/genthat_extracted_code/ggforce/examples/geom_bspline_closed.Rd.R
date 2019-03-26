library(ggforce)


### Name: geom_bspline_closed
### Title: Create closed b-spline shapes
### Aliases: geom_bspline_closed stat_bspline_closed geom_bspline_closed0

### ** Examples

# Create 6 random control points
controls <- data.frame(
  x = runif(6),
  y = runif(6)
)

ggplot(controls, aes(x, y)) +
  geom_polygon(fill = NA, colour = 'grey') +
  geom_point(colour = 'red') +
  geom_bspline_closed(alpha = 0.5)

# The 0 version approximates the correct shape
ggplot(controls, aes(x, y)) +
  geom_polygon(fill = NA, colour = 'grey') +
  geom_point(colour = 'red') +
  geom_bspline_closed0(alpha = 0.5)

# But only the standard version supports geom_shape operations
# Be aware of self-intersections though
ggplot(controls, aes(x, y)) +
  geom_polygon(fill = NA, colour = 'grey') +
  geom_point(colour = 'red') +
  geom_bspline_closed(alpha = 0.5, expand = unit(2, 'cm'))



