library(checkmate)


### Name: anyNaN
### Title: Check if an object contains NaN values
### Aliases: anyNaN

### ** Examples

anyNaN(1:10)
anyNaN(c(1:10, NaN))
iris[3, 3] = NaN
anyNaN(iris)



