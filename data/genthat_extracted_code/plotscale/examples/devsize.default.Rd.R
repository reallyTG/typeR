library(plotscale)


### Name: devsize.default
### Title: Determine Device Size by Default
### Aliases: devsize.default

### ** Examples

options(example.ask = FALSE)
options(device.ask.default = FALSE)
library(lattice)
data(iris)
x <- xyplot(Petal.Width~Petal.Length, groups = Species, data = iris)
## No test: 
devsize(x, width = 4, height = 4, digits = 1, verbose = TRUE)
## End(No test)
devsize(x, width = 4, height = 5, digits = 1, verbose = TRUE)
## No test: 
x <- update(x, aspect = 1)
devsize(x, width = 4, height = 4, digits = 1, verbose = TRUE)
## End(No test)
devsize(x, width = 4, height = 5, digits = 1, verbose = TRUE)
## No test: 
devsize(splom(iris[,1:4]), width = 4, height = 4)
devsize(xyplot(Sepal.Length ~ Sepal.Width | Species, data = iris), width = 4, height = 4)
library(ggplot2)
p <- ggplot(data = iris, mapping = aes(y = Sepal.Length, x = Sepal.Width)) +
  geom_point() + facet_wrap(~Species)
devsize(p, width = 4, height = 4)
devsize(p + theme(aspect.ratio = 1), width = 4, height = 4)
## End(No test)



