library(autocogs)


### Name: layer_info
### Title: Data List
### Aliases: layer_info layer_info.default layer_info.ggplot

### ** Examples

require(ggplot2)
p <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point(data = mpg, mapping = aes(cty, hwy))
layer_info(p)



