library(checkmate)


### Name: anyInfinite
### Title: Check if an object contains infinite values
### Aliases: anyInfinite

### ** Examples

anyInfinite(1:10)
anyInfinite(c(1:10, Inf))
iris[3, 3] = Inf
anyInfinite(iris)



