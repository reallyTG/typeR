library(useful)


### Name: multiple_format
### Title: multiple_format
### Aliases: multiple_format

### ** Examples


library(scales)
vect <- c(1000, 1500, 23450, 21784, 875003780)
multiple_format()(vect)
multiple_format(extra=dollar)(vect)
multiple_format(extra=identity)(vect)

require(ggplot2)
data(diamonds)
ggplot(diamonds, aes(x=x, y=y, color=price*100)) + geom_point() + 
scale_color_gradient2(labels=multiple_format(extra=dollar))




