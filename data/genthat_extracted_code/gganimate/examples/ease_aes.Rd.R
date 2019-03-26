library(gganimate)


### Name: ease_aes
### Title: Control easing of aesthetics
### Aliases: ease_aes

### ** Examples

anim <- ggplot(mtcars, aes(mpg, disp)) +
  transition_states(gear, transition_length = 2, state_length = 1) +
  enter_fade() +
  exit_fade()

## Not run: 
##D # Default uses linear easing
##D animate(anim)
## End(Not run)

# Change all to 'cubic-in-out' for a smoother appearance
anim1 <- anim +
  ease_aes('cubic-in-out')
## Not run: 
##D animate(anim1)
## End(Not run)

# Only change easing of y variables
anim2 <- anim +
  ease_aes(y = 'bounce-in')
## Not run: 
##D animate(anim2)
## End(Not run)




