library(cba)


### Name: circleplot.dist
### Title: Plotting Distance Graphs
### Aliases: circleplot.dist
### Keywords: hplot cluster

### ** Examples

##
data(iris)
d <- dist(iris[,-5])[[1:26]]
circleplot.dist(d, col = 2, scale = 1)

dimnames(d) <- LETTERS[1:26]
circleplot.dist(d)



