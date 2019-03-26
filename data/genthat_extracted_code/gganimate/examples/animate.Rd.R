library(gganimate)


### Name: animate
### Title: Render a gganim object
### Aliases: animate animate.gganim print.gganim knit_print.gganim

### ** Examples

anim <- ggplot(mtcars, aes(mpg, disp)) +
  transition_states(gear, transition_length = 2, state_length = 1) +
  enter_fade() +
  exit_fade()

## Not run: 
##D # Explicitly animate using default (same as just printing the animation)
##D animate(anim)
##D 
##D # Change duration and framerate
##D animate(anim, fps = 20, duration = 15)
##D 
##D # Make the animation pause at the end and then rewind
##D animate(anim, nframes = 100, end_pause = 10, rewind = TRUE)
##D 
##D # Use a different renderer
##D animate(anim, renderer = file_renderer('~/animation/'))[1:6]
## End(Not run)




