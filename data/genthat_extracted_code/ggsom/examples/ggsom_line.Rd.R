library(ggsom)


### Name: ggsom_line
### Title: ggsom_line
### Aliases: ggsom_line

### ** Examples


library(ggthemes)
library(ggsom)
library(ggplot2)
library(kohonen)

iris_som <- som(scale(iris[1:4]), grid = somgrid(6, 4, 'rectangular'))

ggsom_line(aes_som(iris_som), TRUE)




