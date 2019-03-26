library(ggridges)


### Name: geom_ridgeline
### Title: Plot a ridgeline (line with filled area underneath)
### Aliases: geom_ridgeline GeomRidgeline
### Keywords: datasets

### ** Examples

library(ggplot2)

d <- data.frame(x = rep(1:5, 3), y = c(rep(0, 5), rep(1, 5), rep(3, 5)),
                height = c(0, 1, 3, 4, 0, 1, 2, 3, 5, 4, 0, 5, 4, 4, 1))
ggplot(d, aes(x, y, height = height, group = y)) + geom_ridgeline(fill="lightblue")




