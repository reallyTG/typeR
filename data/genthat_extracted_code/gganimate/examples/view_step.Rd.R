library(gganimate)


### Name: view_step
### Title: Follow the data in steps
### Aliases: view_step view_step_manual

### ** Examples

anim <- ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_point() +
  transition_states(Species, transition_length = 2, state_length = 1) +
  view_step(pause_length = 2, step_length = 1, nsteps = 3)

# Default is to include the data from the two states you're stepping between
# but this can be turned off
anim <- ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_point() +
  transition_states(Species, transition_length = 2, state_length = 1) +
  view_step(pause_length = 2, step_length = 1, nsteps = 3, include = FALSE)

# Default is to work off-beat of transition_states so that view changes while
# data is static. Setting pause_first=TRUE changes this
anim <- ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_point() +
  transition_states(Species, transition_length = 2, state_length = 1) +
  view_step(pause_length = 1, step_length = 2, nsteps = 3, pause_first = TRUE)

# If the transition doesn't wrap, then the view shouldn't either
anim <- ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_point() +
  transition_states(Species, transition_length = 2, state_length = 1, wrap = FALSE) +
  view_step(pause_length = 2, step_length = 1, nsteps = 3, wrap = FALSE)




