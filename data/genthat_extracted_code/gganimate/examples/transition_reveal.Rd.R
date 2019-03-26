library(gganimate)


### Name: transition_reveal
### Title: Reveal data along a given dimension
### Aliases: transition_reveal

### ** Examples

anim <- ggplot(airquality, aes(Day, Temp, group = Month)) +
  geom_line() +
  transition_reveal(Day)

# Non-paths will only show the current position, not the history
anim1 <- ggplot(airquality, aes(Day, Temp, group = Month)) +
  geom_line() +
  geom_point(colour = 'red', size = 3) +
  transition_reveal(Day)

# Points can be kept by giving them a unique group and set `keep = TRUE` (the
# default)
anim2 <- ggplot(airquality, aes(Day, Temp, group = Month)) +
  geom_line() +
  geom_point(aes(group = seq_along(Day))) +
  geom_point(colour = 'red', size = 3) +
  transition_reveal(Day)




