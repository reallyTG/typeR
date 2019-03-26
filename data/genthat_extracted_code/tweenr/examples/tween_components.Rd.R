library(tweenr)


### Name: tween_components
### Title: Interpolate individual component
### Aliases: tween_components

### ** Examples


from_zero <- function(x) {x$x <- 0; x}

data <- data.frame(
  x = c(1, 2, 2, 1, 2, 2),
  y = c(1, 2, 2, 2, 1, 1),
  time = c(1, 4, 10, 4, 8, 10),
  id = c(1, 1, 1, 2, 2, 2)
)

data <- tween_components(data, 'cubic-in-out', nframes = 100, time = time,
                         id = id, enter = from_zero, enter_length = 4)




