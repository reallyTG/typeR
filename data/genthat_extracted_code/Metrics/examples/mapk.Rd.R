library(Metrics)


### Name: mapk
### Title: Mean Average Precision at k
### Aliases: mapk

### ** Examples

actual <- list(c('a', 'b'), c('a'), c('x', 'y', 'b'))
predicted <- list(c('a', 'c', 'd'), c('x', 'b', 'a', 'b'), c('y'))
mapk(2, actual, predicted)

actual <- list(c(1, 5, 7, 9), c(2, 3), c(2, 5, 6))
predicted <- list(c(5, 6, 7, 8, 9), c(1, 2, 3), c(2, 4, 6, 8))
mapk(3, actual, predicted)



