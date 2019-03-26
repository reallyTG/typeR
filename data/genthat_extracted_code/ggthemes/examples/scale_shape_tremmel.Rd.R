library(ggthemes)


### Name: scale_shape_tremmel
### Title: Shape scales from Tremmel (1995)
### Aliases: scale_shape_tremmel

### ** Examples

library("ggplot2")

p <- ggplot(mtcars, aes(x = mpg, y = hp, shape = factor(cyl))) +
  geom_point()

p + scale_shape_tremmel()
p + scale_shape_tremmel(alt = TRUE)
p + scale_shape_tremmel(overlap = TRUE)



