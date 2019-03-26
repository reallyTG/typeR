library(tweenr)


### Name: tween_elements
### Title: Create frames based on individual element states
### Aliases: tween_elements

### ** Examples

data <- data.frame(
  x = c(1, 2, 2, 1, 2, 2),
  y = c(1, 2, 2, 2, 1, 1),
  time = c(1, 4, 10, 4, 8, 10),
  group = c(1, 1, 1, 2, 2, 2),
  ease = rep('cubic-in-out', 6)
)

data <- tween_elements(data, 'time', 'group', 'ease', nframes = 100)




