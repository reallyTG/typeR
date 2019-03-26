library(gganimate)


### Name: shadow_wake
### Title: Show preceding frames with gradual falloff
### Aliases: shadow_wake

### ** Examples

anim <- ggplot(iris, aes(Petal.Length, Sepal.Length)) +
  geom_point() +
  labs(title = "{closest_state}") +
  transition_states(Species, transition_length = 4, state_length = 1)

# `shadow_wake` can be combined with e.g. `transition_states` to show
# motion of geoms as they are in transition with respect to the selected state.
anim1 <- anim +
  shadow_wake(wake_length = 0.05)

# Different qualities can be manipulated by setting a value for it that it
# should taper off to
anim2 <- anim +
  shadow_wake(0.1, size = 10, alpha = FALSE, colour = 'grey92')

# Use `detail` in the `animate()` call to increase the number of calculated
# frames and thus make the wake smoother
## Not run: 
##D animate(anim2, detail = 5)
## End(Not run)




