library(ggridges)


### Name: geom_vridgeline
### Title: Plot a vertical ridgeline (ridgeline rotated 90 degrees)
### Aliases: geom_vridgeline GeomVRidgeline
### Keywords: datasets

### ** Examples

library(ggplot2)

d <- data.frame(y = rep(1:5, 3), x = c(rep(0, 5), rep(1, 5), rep(3, 5)),
                width = c(0, 1, 3, 4, 0, 1, 2, 3, 5, 4, 0, 5, 4, 4, 1))
ggplot(d, aes(x, y, width = width, group = x)) + geom_vridgeline(fill="lightblue")

ggplot(iris, aes(x=Species, y=Sepal.Width, width = ..density.., fill=Species)) +
  geom_vridgeline(stat="ydensity", trim=FALSE, alpha = 0.85, scale = 2)




