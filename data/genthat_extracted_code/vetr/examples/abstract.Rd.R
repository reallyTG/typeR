library(vetr)


### Name: abstract
### Title: Turn S3 Objects Into Templates
### Aliases: abstract abstract.data.frame abstract.default abstract.array
###   abstract.matrix abstract.list abstract.lm abstract.environment
###   abstract.ts

### ** Examples

iris.tpl <- abstract(iris)
alike(iris.tpl, iris[1:10, ])
alike(iris.tpl, transform(iris, Species=as.character(Species)))

abstract(1:10)
abstract(matrix(1:9, nrow=3))
abstract(list(1:9, runif(10)))



