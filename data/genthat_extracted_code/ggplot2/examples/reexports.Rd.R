library(ggplot2)


### Name: reexports
### Title: Objects exported from other packages
### Aliases: reexports alpha unit arrow
### Keywords: internal

### ** Examples

ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha = 0.5, colour = "blue")

ggplot(mpg, aes(displ, hwy)) +
  geom_point(colour = alpha("blue", 0.5))



