library(PPtreeViz)


### Name: PPoptViz
### Title: PPopt visualization
### Aliases: PPoptViz
### Keywords: tree

### ** Examples

data(iris)
PPoptViz(LDAopt(iris[,5],iris[,1:4],q=1))
PPoptViz(LDAopt(iris[,5],iris[,1:4],q=2))



