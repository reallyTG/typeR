library(gganimate)


### Name: transition_filter
### Title: Transition between different filters
### Aliases: transition_filter

### ** Examples

anim <- ggplot(iris, aes(Petal.Width, Petal.Length, colour = Species)) +
  geom_point() +
  transition_filter(
    transition_length = 2,
    filter_length = 1,
    Setosa = Species == 'setosa',
    Long = Petal.Length > 4,
    Wide = Petal.Width > 2
  ) +
  ggtitle(
    'Filter: {closest_filter}',
    subtitle = '{closest_expression}'
  ) +
  enter_fade() +
  exit_fly(y_loc = 0)

# Setting `keep = TRUE` allows you to keep the culled data on display. Only
# exit functions will be used in that case (as elements enters from the
# result of the exit function)
anim2 <- ggplot(iris, aes(Petal.Width, Petal.Length, colour = Species)) +
  geom_point() +
  transition_filter(
    transition_length = 2,
    filter_length = 1,
    Setosa = Species == 'setosa',
    Long = Petal.Length > 4,
    Wide = Petal.Width > 2,
    keep = TRUE
  ) +
  ggtitle(
    'Filter: {closest_filter}',
    subtitle = '{closest_expression}'
  ) +
  exit_recolour(colour = 'grey') +
  exit_shrink(size = 0.5)




