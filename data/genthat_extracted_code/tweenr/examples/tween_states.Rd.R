library(tweenr)


### Name: tween_states
### Title: Tween a list of data.frames representing states
### Aliases: tween_states

### ** Examples

data1 <- data.frame(
  x = 1:20,
  y = 0,
  colour = 'forestgreen',
  stringsAsFactors = FALSE
)
data2 <- data1
data2$x <- 20:1
data2$y <- 1

data <- tween_states(list(data1, data2), 3, 1, 'cubic-in-out', 100)




