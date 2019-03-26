library(NoiseFiltersR)


### Name: ENN
### Title: Edited Nearest Neighbors
### Aliases: ENN ENN.default ENN.formula

### ** Examples

data(iris)
out <- ENN(Species~., data = iris, k = 5)
summary(out)
identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])



