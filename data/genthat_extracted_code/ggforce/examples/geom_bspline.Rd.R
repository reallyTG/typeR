library(ggforce)


### Name: geom_bspline
### Title: B-splines based on control points
### Aliases: geom_bspline stat_bspline stat_bspline2 geom_bspline2
###   stat_bspline0 geom_bspline0

### ** Examples

# Define some control points
cp <- data.frame(
  x = c(
    0, -5, -5, 5, 5, 2.5, 5, 7.5, 5, 2.5, 5, 7.5, 5, -2.5, -5, -7.5, -5,
    -2.5, -5, -7.5, -5
  ),
  y = c(
    0, -5, 5, -5, 5, 5, 7.5, 5, 2.5, -5, -7.5, -5, -2.5, 5, 7.5, 5, 2.5,
    -5, -7.5, -5, -2.5
  ),
  class = sample(letters[1:3], 21, replace = TRUE)
)

# Now create some paths between them
paths <- data.frame(
  ind = c(
    7, 5, 8, 8, 5, 9, 9, 5, 6, 6, 5, 7, 7, 5, 1, 3, 15, 8, 5, 1, 3, 17, 9, 5,
    1, 2, 19, 6, 5, 1, 4, 12, 7, 5, 1, 4, 10, 6, 5, 1, 2, 20
  ),
  group = c(
    1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7,
    7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10
  )
)
paths$x <- cp$x[paths$ind]
paths$y <- cp$y[paths$ind]
paths$class <- cp$class[paths$ind]

ggplot(paths) +
  geom_bspline(aes(x = x, y = y, group = group, colour = ..index..)) +
  geom_point(aes(x = x, y = y), data = cp, color = 'steelblue')

ggplot(paths) +
  geom_bspline2(aes(x = x, y = y, group = group, colour = class)) +
  geom_point(aes(x = x, y = y), data = cp, color = 'steelblue')

ggplot(paths) +
  geom_bspline0(aes(x = x, y = y, group = group)) +
  geom_point(aes(x = x, y = y), data = cp, color = 'steelblue')




