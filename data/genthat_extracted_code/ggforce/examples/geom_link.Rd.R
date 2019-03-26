library(ggforce)


### Name: geom_link
### Title: Link points with paths
### Aliases: geom_link stat_link stat_link2 geom_link2 geom_link0

### ** Examples

# Lets make some data
lines <- data.frame(
  x = c(5, 12, 15, 9, 6),
  y = c(17, 20, 4, 15, 5),
  xend = c(19, 17, 2, 9, 5),
  yend = c(10, 18, 7, 12, 1),
  width = c(1, 10, 6, 2, 3),
  colour = letters[1:5]
)

ggplot(lines) +
  geom_link(aes(x = x, y = y, xend = xend, yend = yend, colour = colour,
                alpha = stat(index), size = stat(index)))

ggplot(lines) +
  geom_link2(aes(x = x, y = y, colour = colour, size = width, group = 1),
             lineend = 'round', n = 500)

# geom_link0 is simply an alias for geom_segment to put the link geoms in
# line with the other line geoms with multiple versions. `index` is not
# available here
ggplot(lines) +
  geom_link0(aes(x = x, y = y, xend = xend, yend = yend, colour = colour))



