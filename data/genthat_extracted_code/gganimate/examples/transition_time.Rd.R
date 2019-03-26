library(gganimate)


### Name: transition_time
### Title: Transition through distinct states in time
### Aliases: transition_time

### ** Examples

anim <- ggplot(airquality, aes(Day, Temp)) +
  geom_point(aes(colour = factor(Month))) +
  transition_time(Day)

# Removing a time point will prolong the tweening between neighbouring time
# points so the time dimension stays linear
airquality_missing <- airquality[airquality$Day <= 10 | airquality$Day >= 20, ]
anim1 <- ggplot(airquality_missing, aes(Day, Temp)) +
  geom_point(aes(colour = factor(Month))) +
  transition_time(Day)

# Range can be constrained if needed
anim2 <- ggplot(airquality, aes(Day, Temp)) +
  geom_point(aes(colour = factor(Month))) +
  transition_time(Day, range = c(10L, 20L))

# The group aesthetic is used to connect elements
# No grouping
anim3 <- ggplot(airquality, aes(Day, Temp)) +
  geom_line() +
  transition_time(Month)

# Group by month
anim4 <- ggplot(airquality, aes(Day, Temp)) +
  geom_line(aes(group = Month)) +
  transition_time(Month) +
  enter_fade() +
  exit_fade()



