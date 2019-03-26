library(ggplot2)


### Name: +.gg
### Title: Add components to a plot
### Aliases: +.gg %+%

### ** Examples

base <- ggplot(mpg, aes(displ, hwy)) + geom_point()
base + geom_smooth()

# To override the data, you must use %+%
base %+% subset(mpg, fl == "p")

# Alternatively, you can add multiple components with a list.
# This can be useful to return from a function.
base + list(subset(mpg, fl == "p"), geom_smooth())



