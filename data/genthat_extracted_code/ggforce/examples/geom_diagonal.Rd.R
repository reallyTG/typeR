library(ggforce)


### Name: geom_diagonal
### Title: Draw horizontal diagonals
### Aliases: geom_diagonal stat_diagonal stat_diagonal2 geom_diagonal2
###   stat_diagonal0 geom_diagonal0

### ** Examples

data <- data.frame(
  x = rep(0, 10),
  y = 1:10,
  xend = 1:10,
  yend = 2:11
)

ggplot(data) +
  geom_diagonal(aes(x, y, xend = xend, yend = yend))

# The standard version provides an index to create gradients
ggplot(data) +
  geom_diagonal(aes(x, y, xend = xend, yend = yend, alpha = stat(index)))

# The 0 version uses bezierGrob under the hood for an approximation
ggplot(data) +
  geom_diagonal0(aes(x, y, xend = xend, yend = yend))

# The 2 version allows you to interpolate between endpoint aesthetics
data2 <- data.frame(
  x = c(data$x, data$xend),
  y = c(data$y, data$yend),
  group = rep(1:10, 2),
  colour = sample(letters[1:5], 20, TRUE)
)
ggplot(data2) +
  geom_diagonal2(aes(x, y, group = group, colour = colour))

# Use strength to control the steepness of the central region
ggplot(data, aes(x, y, xend = xend, yend = yend)) +
  geom_diagonal(strength = 0.75, colour = 'red') +
  geom_diagonal(strength = 0.25, colour = 'blue')




