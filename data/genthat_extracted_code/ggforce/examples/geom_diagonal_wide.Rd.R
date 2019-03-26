library(ggforce)


### Name: geom_diagonal_wide
### Title: Draw an area defined by an upper and lower diagonal
### Aliases: geom_diagonal_wide stat_diagonal_wide

### ** Examples

data <- data.frame(
  x = c(1, 2, 2, 1, 2, 3, 3, 2),
  y = c(1, 2, 3, 2, 3, 1, 2, 5),
  group = c(1, 1, 1, 1, 2, 2, 2, 2)
)

ggplot(data) +
  geom_diagonal_wide(aes(x, y, group = group))

# The strength control the steepness
ggplot(data, aes(x, y, group = group)) +
  geom_diagonal_wide(strength = 0.75, alpha = 0.5, fill = 'red') +
  geom_diagonal_wide(strength = 0.25, alpha = 0.5, fill = 'blue')

# The diagonal_wide geom uses geom_shape under the hood, so corner rounding
# etc are all there
ggplot(data) +
  geom_diagonal_wide(aes(x, y, group = group), radius = unit(5, 'mm'))




