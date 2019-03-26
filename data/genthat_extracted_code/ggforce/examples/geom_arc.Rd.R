library(ggforce)


### Name: geom_arc
### Title: Arcs based on radius and radians
### Aliases: geom_arc stat_arc stat_arc2 geom_arc2 stat_arc0 geom_arc0

### ** Examples

# Lets make some data
arcs <- data.frame(
  start = seq(0, 2 * pi, length.out = 11)[-11],
  end = seq(0, 2 * pi, length.out = 11)[-1],
  r = rep(1:2, 5)
)

# Behold the arcs
ggplot(arcs) +
  geom_arc(aes(x0 = 0, y0 = 0, r = r, start = start, end = end,
               linetype = factor(r)))

# Use the calculated index to map values to position on the arc
ggplot(arcs) +
  geom_arc(aes(x0 = 0, y0 = 0, r = r, start = start, end = end,
               size = stat(index)), lineend = 'round') +
  scale_radius() # linear size scale

# The 0 version maps directly to curveGrob instead of calculating the points
# itself
ggplot(arcs) +
  geom_arc0(aes(x0 = 0, y0 = 0, r = r, start = start, end = end,
                linetype = factor(r)))

# The 2 version allows interpolation of aesthetics between the start and end
# points
arcs2 <- data.frame(
  angle = c(arcs$start, arcs$end),
  r = rep(arcs$r, 2),
  group = rep(1:10, 2),
  colour = sample(letters[1:5], 20, TRUE)
)

ggplot(arcs2) +
  geom_arc2(aes(x0 = 0, y0 = 0, r = r, end = angle, group = group,
                colour = colour), size = 2)




