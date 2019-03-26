library(useful)


### Name: multiple.identity
### Title: multiple.identity
### Aliases: multiple.identity

### ** Examples


vect <- c(1000, 1500, 23450, 21784, 875003780)
multiple.identity(vect)
multiple.identity(vect, multiple="k")
multiple.identity(vect, multiple="h")

require(ggplot2)
data(diamonds)
ggplot(diamonds, aes(x=x, y=y, color=price*100)) + geom_point() + 
scale_color_gradient2(labels=multiple.identity)




