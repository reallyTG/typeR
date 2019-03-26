library(useful)


### Name: multiple
### Title: multiple
### Aliases: multiple

### ** Examples


require(scales)
vect <- c(1000, 1500, 23450, 21784, 875003780)
multiple(vect)
multiple(vect, extra=dollar)
multiple(vect, extra=identity)

require(ggplot2)
data(diamonds)
ggplot(diamonds, aes(x=x, y=y, color=price*100)) + geom_point() + 
scale_color_gradient2(labels=multiple)




