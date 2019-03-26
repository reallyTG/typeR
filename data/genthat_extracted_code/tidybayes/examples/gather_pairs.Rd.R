library(tidybayes)


### Name: gather_pairs
### Title: Gather pairwise combinations of values from key/value columns in
###   a long-format data frame
### Aliases: gather_pairs
### Keywords: manip

### ** Examples


library(ggplot2)
library(dplyr)

t_a = rnorm(100)
t_b = rnorm(100, t_a * 2)
t_c = rnorm(100)

df = rbind(
  data.frame(g = "a", t = t_a),
  data.frame(g = "b", t = t_b),
  data.frame(g = "c", t = t_c)
)

df %>%
  gather_pairs(g, t, row = "g_row", col = "g_col", x = "t_x", y = "t_y") %>%
  ggplot(aes(t_x, t_y)) +
  geom_point() +
  facet_grid(vars(g_row), vars(g_col))

df %>%
  gather_pairs(g, t, triangle = "upper") %>%
  ggplot(aes(.x, .y)) +
  geom_point() +
  facet_grid(vars(.row), vars(.col))

df %>%
  gather_pairs(g, t, triangle = "both") %>%
  ggplot(aes(.x, .y)) +
  geom_point() +
  facet_grid(vars(.row), vars(.col))

data(line, package = "coda")

line %>%
  tidy_draws() %>%
  gather_variables() %>%
  gather_pairs(.variable, .value) %>%
  ggplot(aes(.x, .y)) +
  geom_point(alpha = .25) +
  facet_grid(vars(.row), vars(.col))

line %>%
  tidy_draws() %>%
  gather_variables() %>%
  gather_pairs(.variable, .value) %>%
  ggplot(aes(.x, .y, color = factor(.chain))) +
  geom_density_2d(alpha = .5) +
  facet_grid(vars(.row), vars(.col))




