library(gganimate)


### Name: transition_manual
### Title: Create an animation by specifying the frame membership directly
### Aliases: transition_manual

### ** Examples

anim <- ggplot(mtcars, aes(factor(gear), mpg)) +
  geom_boxplot() +
  transition_manual(gear)

# Using `cumulative = TRUE` to keep data from older frames
anim2 <- ggplot(mtcars, aes(factor(gear), mpg)) +
  geom_boxplot() +
  transition_manual(gear, cumulative = TRUE)

# Use `factor()` to set the order of the frames
anim3 <- ggplot(mtcars, aes(factor(gear), mpg)) +
  geom_boxplot() +
  transition_manual(factor(gear, levels = c('4', '3', '5')))




