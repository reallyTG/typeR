library(gganimate)


### Name: shadow_trail
### Title: A trail of evenly spaced old frames
### Aliases: shadow_trail

### ** Examples

anim <- ggplot(airquality, aes(Day, Temp, colour = factor(Month))) +
  geom_point() +
  transition_time(Day)

# Change distance between points
anim1 <- anim +
  shadow_trail(0.02)

# Style shadow differently
anim2 <- anim +
  shadow_trail(alpha = 0.3, shape = 2)

# Restrict the shadow to 10 frames
anim3 <- anim +
  shadow_trail(max_frames = 10)




