library(ggsom)


### Name: ggsom_ribbon
### Title: ggsom_ribbon
### Aliases: ggsom_ribbon

### ** Examples


library(ggthemes)
library(ggsom)
library(ggplot2)
library(kohonen)

iris_som <- som(scale(iris[1:4]), grid = somgrid(6, 4, 'rectangular'))

ggsom_ribbon(aes_som(iris_som, cutree_value=3), FALSE)




