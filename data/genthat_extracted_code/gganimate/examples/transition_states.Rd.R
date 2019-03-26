library(gganimate)


### Name: transition_states
### Title: Transition between several distinct stages of the data
### Aliases: transition_states

### ** Examples

anim <- ggplot(iris, aes(Sepal.Width, Petal.Width)) +
  geom_point() +
  labs(title = "{closest_state}") +
  transition_states(Species, transition_length = 3, state_length = 1)

# Use a unique group to avoid matching graphic elements
iris$group <- seq_len(nrow(iris))
anim1 <- ggplot(iris, aes(Sepal.Width, Petal.Width, group = group)) +
  geom_point() +
  labs(title = "{closest_state}") +
  transition_states(Species, transition_length = 3, state_length = 1) +
  enter_fade() +
  exit_fade()

# Set `wrap = FALSE` to avoid transitioning the last state to the first
anim2 <- ggplot(iris, aes(Sepal.Width, Petal.Width)) +
  geom_point() +
  labs(title = "{closest_state}") +
  transition_states(Species, transition_length = 3, state_length = 1,
                    wrap = FALSE)




