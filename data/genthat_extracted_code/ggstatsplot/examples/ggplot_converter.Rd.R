library(ggstatsplot)


### Name: ggplot_converter
### Title: Transform object of any other class to an object of class
###   'ggplot'.
### Aliases: ggplot_converter

### ** Examples

library(ggplot2)

# creating a plot that is not of class `ggplot`
p <- ggExtra::ggMarginal(ggplot(mtcars, aes(wt, mpg)) + geom_point())

# checking class of object
class(p)

# checking class of converted plot
p_converted <- ggstatsplot::ggplot_converter(p)
class(p_converted)



