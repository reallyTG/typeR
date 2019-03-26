library(gganimate)


### Name: transition_layers
### Title: Build up a plot, layer by layer
### Aliases: transition_layers

### ** Examples

# Default is to use layer order and keep layers for duration of animation
anim <- ggplot(mtcars, aes(mpg, disp)) +
  geom_point() +
  geom_smooth(colour = 'grey', se = FALSE) +
  geom_smooth(aes(colour = factor(gear))) +
  transition_layers(layer_length = 1, transition_length = 2) +
  enter_fade() + enter_grow()

# Start with the first layer already present
anim1 <- ggplot(mtcars, aes(mpg, disp)) +
  geom_point() +
  geom_smooth(colour = 'grey', se = FALSE) +
  geom_smooth(aes(colour = factor(gear))) +
  transition_layers(layer_length = 1, transition_length = 2,
                    from_blank = FALSE) +
  enter_fade() + enter_grow()

# Change the order of the layers
anim2 <- ggplot(mtcars, aes(mpg, disp)) +
  geom_point() +
  geom_smooth(colour = 'grey', se = FALSE) +
  geom_smooth(aes(colour = factor(gear))) +
  transition_layers(layer_length = 1, transition_length = 2,
                    from_blank = FALSE, layer_order = c(3, 1, 2)) +
  enter_fade() + enter_grow()

# Keep layer 1 for the whole animation, but remove the 2nd layer as the 3rd
# enters
anim3 <- ggplot(mtcars, aes(mpg, disp)) +
  geom_point() +
  geom_smooth(colour = 'grey', se = FALSE) +
  geom_smooth(aes(colour = factor(gear))) +
  transition_layers(layer_length = 1, transition_length = 2,
                    from_blank = FALSE, keep_layers = c(Inf, 0, 0)) +
  enter_fade() + enter_grow() +
  exit_fade() + exit_shrink()




