library(Tmisc)


### Name: Tpairs
### Title: Better scatterplot matrices.
### Aliases: Tpairs
### Keywords: NA

### ** Examples

Tpairs(iris[-5])
Tpairs(iris[-5], pch=21, bg=Tcols[factor(iris$Species)])
Tpairs(iris[-5], pch=21, bg=gghues(3)[factor(iris$Species)], gap=1)




