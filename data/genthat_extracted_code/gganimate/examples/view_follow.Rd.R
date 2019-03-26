library(gganimate)


### Name: view_follow
### Title: Let the view follow the data in each frame
### Aliases: view_follow

### ** Examples

anim <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  labs(title = "{closest_state}") +
  transition_states(Species, transition_length = 4, state_length = 1) +
  view_follow()

# Fixing a dimension can be done in general
anim1 <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  labs(title = "{closest_state}") +
  transition_states(Species, transition_length = 4, state_length = 1) +
  view_follow(fixed_x = TRUE)

# ...or just for one side of the range
anim1 <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  labs(title = "{closest_state}") +
  transition_states(Species, transition_length = 4, state_length = 1) +
  view_follow(fixed_x = c(4, NA), fixed_y = c(2, NA))




