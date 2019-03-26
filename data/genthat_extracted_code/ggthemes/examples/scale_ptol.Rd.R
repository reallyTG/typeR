library(ggthemes)


### Name: scale_colour_ptol
### Title: Color Scales from Paul Tol's "Colour Schemes
### Aliases: scale_colour_ptol scale_color_ptol scale_fill_ptol

### ** Examples

library("ggplot2")

p2 <- ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(gear))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_ptol("cyl") +
  theme_minimal() +
  ggtitle("Cars")

ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  scale_fill_ptol() +
  theme_minimal()



