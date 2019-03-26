library(ggthemes)


### Name: circlefill_shape_pal
### Title: Filled Circle Shape palette (discrete)
### Aliases: circlefill_shape_pal

### ** Examples

library("ggplot2")

p <- ggplot(mtcars, aes(x = mpg, y = hp, shape = factor(cyl))) +
 geom_point()

p + scale_shape_tremmel()
p + scale_shape_circlefill()
p + scale_shape_cleveland()
p + scale_shape_cleveland(overlap = TRUE)



