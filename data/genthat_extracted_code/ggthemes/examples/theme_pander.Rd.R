library(ggthemes)


### Name: theme_pander
### Title: A ggplot theme originated from the pander package
### Aliases: theme_pander

### ** Examples

require("ggplot2")
require("pander")

p <- ggplot(mtcars, aes(x = mpg, y = wt)) +
     geom_point()
p + theme_pander()

panderOptions("graph.grid.color", "red")
p + theme_pander()

p <- ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point()
p + theme_pander() + scale_color_pander()

ggplot(mpg, aes(x = class, fill = drv)) +
  geom_bar() +
  scale_fill_pander() +
  theme_pander()



