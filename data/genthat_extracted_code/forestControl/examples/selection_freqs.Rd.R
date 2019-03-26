library(forestControl)


### Name: selection_freqs
### Title: Variable Selection Frequencies
### Aliases: selection_freqs

### ** Examples

library(randomForest)
data(iris)
iris.rf <- randomForest(iris[,-5], iris[,5], forest = TRUE)

iris.freqs <- selection_freqs(iris.rf)
print(iris.freqs)



