library(Compositional)


### Name: Hypothesis testing for two or more compositional mean vectors
### Title: Hypothesis testing for two or more compositional mean vectors
### Aliases: comp.test
### Keywords: Multivariate hypothesis testing non parametric test
###   compositional data

### ** Examples

ina <- rep(1:2, each = 50)
comp.test( as.matrix(iris[1:100, 1:4]), ina, test = "james", R = 0 )
comp.test( as.matrix(iris[1:100, 1:4]), ina, test = "hotel", R = 0 )
comp.test( as.matrix(iris[1:100, 1:4]), ina, test = "el", R = 0 )
comp.test( as.matrix(iris[1:100, 1:4]), ina, test = "eel", R = 0 )



