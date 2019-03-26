library(RSNNS)


### Name: decodeClassLabels
### Title: Decode class labels to a binary matrix
### Aliases: decodeClassLabels

### ** Examples

decodeClassLabels(c(1,3,2,3))
decodeClassLabels(c("r","b","b","r", "g", "g"))

data(iris)
decodeClassLabels(iris[,5])



