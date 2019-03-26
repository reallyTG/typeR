library(geomnet)


### Name: GeomCircle
### Title: Geom for drawing circles in the ggplot2 framework
### Aliases: GeomCircle geom_circle
### Keywords: datasets

### ** Examples

# circles are drawn centered at x and y
library(ggplot2)
data(mpg)
ggplot(mpg, aes(displ, hwy)) + geom_circle(radius=0.1) + geom_point()
ggplot(mpg, aes(displ, hwy)) + geom_circle(linetype=2, radius=0.05, alpha=0.5)
ggplot(mpg, aes(displ, hwy)) + geom_circle(aes(linetype=factor(cyl)), radius=0.05, alpha=0.5)



