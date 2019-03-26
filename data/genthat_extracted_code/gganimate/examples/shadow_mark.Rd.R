library(gganimate)


### Name: shadow_mark
### Title: Show original data as background marks
### Aliases: shadow_mark

### ** Examples

# Use any of the aesthetics to add a style to either the past or the future raw data.
# Adding a grouping variable in a transition call prior to calling `shadow_mark()` will
# allow transitioning through different states in time.

p1 <- ggplot(airquality, aes(Day, Temp)) +
  geom_line(color = 'red', size = 1) +
  transition_time(Month) +
  shadow_mark(colour = 'black', size = 0.75)

# animate(p1)

# Add a future = TRUE argument to show data later in the animation.

p2 <- ggplot(airquality, aes(Day, Temp)) +
  geom_line(color = 'red', size = 1) +
  transition_time(Month) +
  shadow_mark(color = 'black', size = 0.75, past = FALSE, future = TRUE)

# animate(p2)




