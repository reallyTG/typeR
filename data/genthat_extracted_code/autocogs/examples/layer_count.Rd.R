library(autocogs)


### Name: layer_count
### Title: Plot layer count
### Aliases: layer_count layer_count.default layer_count.ggplot

### ** Examples

library(ggplot2)
p <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()
layer_count(p) # 1
layer_count(p + geom_smooth(method = "lm") + geom_density_2d()) # 3



