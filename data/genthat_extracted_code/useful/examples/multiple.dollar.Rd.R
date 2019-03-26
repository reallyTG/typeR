library(useful)


### Name: multiple.dollar
### Title: multiple.dollar
### Aliases: multiple.dollar

### ** Examples


require(scales)
vect <- c(1000, 1500, 23450, 21784, 875003780)
multiple.dollar(vect)
multiple.dollar(vect, multiple="k")
multiple.dollar(vect, multiple="h")

require(ggplot2)
data(diamonds)
ggplot(diamonds, aes(x=x, y=y, color=price*100)) + geom_point() + 
scale_color_gradient2(labels=multiple.dollar)




