library(ggforce)


### Name: geom_arc_bar
### Title: Arcs and wedges as polygons
### Aliases: geom_arc_bar stat_arc_bar stat_pie

### ** Examples

# If you know the angle spans to plot it is easy
arcs <- data.frame(
  start = seq(0, 2 * pi, length.out = 11)[-11],
  end = seq(0, 2 * pi, length.out = 11)[-1],
  r = rep(1:2, 5)
)

# Behold the arcs
ggplot(arcs) +
  geom_arc_bar(aes(x0 = 0, y0 = 0, r0 = r - 1, r = r, start = start,
                   end = end, fill = r))

# geom_arc_bar uses geom_shape to draw the arcs, so you have all the
# possibilities of that as well, e.g. rounding of corners
ggplot(arcs) +
  geom_arc_bar(aes(x0 = 0, y0 = 0, r0 = r - 1, r = r, start = start,
                   end = end, fill = r), radius = unit(4, 'mm'))

# If you got values for a pie chart, use stat_pie
states <- c(
  'eaten', "eaten but said you didn\'t", 'cat took it', 'for tonight',
  'will decompose slowly'
)
pie <- data.frame(
  state = factor(rep(states, 2), levels = states),
  type = rep(c('Pie', 'Donut'), each = 5),
  r0 = rep(c(0, 0.8), each = 5),
  focus = rep(c(0.2, 0, 0, 0, 0), 2),
  amount = c(4, 3, 1, 1.5, 6, 6, 1, 2, 3, 2),
  stringsAsFactors = FALSE
)

# Look at the cakes
ggplot() + geom_arc_bar(aes(
  x0 = 0, y0 = 0, r0 = r0, r = 1, amount = amount,
  fill = state, explode = focus
),
data = pie, stat = 'pie'
) +
  facet_wrap(~type, ncol = 1) +
  coord_fixed() +
  theme_no_axes() +
  scale_fill_brewer('', type = 'qual')




