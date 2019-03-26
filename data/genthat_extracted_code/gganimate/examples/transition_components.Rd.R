library(gganimate)


### Name: transition_components
### Title: Transition individual components through their own lifecycle
### Aliases: transition_components

### ** Examples

data <- data.frame(
  x = runif(10),
  y = runif(10),
  size = sample(1:3, 10, TRUE),
  time = c(1, 4, 6, 7, 9, 6, 7, 8, 9, 10),
  id = rep(1:2, each = 5)
)

anim <- ggplot(data, aes(x, y, group = id, size = size)) +
  geom_point() +
  transition_components(time)

# By default the time range is set to the range of the time varialbe (plus
# any enter and exit length), but this can be overwritten
anim2 <- ggplot(data, aes(x, y, group = id, size = size)) +
  geom_point() +
  transition_components(time, range = c(4, 8))

# If you are using any enter/exit functions you need to give them some time
anim3 <- ggplot(data, aes(x, y, group = id, size = size)) +
  geom_point() +
  transition_components(time, enter_length = 2, exit_length = 2) +
  enter_grow() +
  exit_fade()




