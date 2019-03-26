library(tweenr)


### Name: tween_appear
### Title: Tween a data.frame of appearances
### Aliases: tween_appear

### ** Examples

data <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  time = sample(50, 100, replace = TRUE)
)

data <- tween_appear(data, 'time', nframes = 200)




