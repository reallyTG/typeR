library(ggfocus)


### Name: ggfocus
### Title: ggfocus
### Aliases: ggfocus

### ** Examples

library(ggplot2)
p <- ggplot(iris,aes(x=Sepal.Length,y=Petal.Length)) + geom_point()
ggfocus(p, Species, "versicolor")




