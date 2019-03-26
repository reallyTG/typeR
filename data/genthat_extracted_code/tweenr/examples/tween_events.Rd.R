library(tweenr)


### Name: tween_events
### Title: Transition in and out of events
### Aliases: tween_events

### ** Examples

d <- data.frame(
  x = runif(20),
  y = runif(20),
  time = runif(20),
  duration = runif(20, max = 0.1)
)
from_left <- function(x) {
  x$x <- -0.5
  x
}
to_right <- function(x) {
  x$x <- 1.5
  x
}

tween_events(d, 'cubic-in-out', 50, start = time, end = time + duration,
             enter = from_left, exit = to_right, enter_length = 0.1,
             exit_length = 0.05)




