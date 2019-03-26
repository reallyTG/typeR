library(gganimate)


### Name: enter_exit
### Title: Define how entering and exiting data behaves
### Aliases: enter_exit enter exit enter_manual enter_appear enter_fade
###   enter_grow enter_recolour enter_recolor enter_fly enter_drift
###   enter_reset exit_manual exit_disappear exit_fade exit_shrink
###   exit_recolour exit_recolor exit_fly exit_drift exit_reset

### ** Examples

# Default is appear/disappear
anim <- ggplot(mtcars, aes(factor(gear), mpg)) +
  geom_boxplot() +
  transition_states(gear, 2, 1)

# Fade-in, fly-out
anim1 <- anim +
  enter_fade() +
  exit_fly(x_loc = 7, y_loc = 40)

# Enter and exit accumulates
anim2 <- anim +
  enter_fade() + enter_grow() +
  exit_fly(x_loc = 7, y_loc = 40) + exit_recolour(fill = 'forestgreen')




