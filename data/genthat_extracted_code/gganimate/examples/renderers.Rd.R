library(gganimate)


### Name: renderers
### Title: Renderers provided by gganimate
### Aliases: renderers gifski_renderer file_renderer av_renderer
###   ffmpeg_renderer magick_renderer sprite_renderer

### ** Examples

anim <- ggplot(mtcars, aes(mpg, disp)) +
  transition_states(gear, transition_length = 2, state_length = 1) +
  enter_fade() +
  exit_fade()

## Not run: 
##D # Renderers are specified in the `animate()` function
##D animate(anim, renderer = sprite_renderer())
## End(Not run)




