library(gganimate)


### Name: transition_events
### Title: Transition individual events in and out
### Aliases: transition_events

### ** Examples

data <- data.frame(
  x = 1:10,
  y = runif(10),
  begin = runif(10, 1, 100),
  length = runif(10, 5, 20),
  enter = runif(10, 5, 10),
  exit = runif(10, 5, 10)
)

anim <- ggplot(data, aes(x, y)) +
  geom_col() +
  transition_events(start = begin,
                    end = begin + length,
                    enter_length = enter,
                    exit_length = exit) +
 enter_grow() +
 exit_drift(x_mod = 11) +
 exit_fade()



