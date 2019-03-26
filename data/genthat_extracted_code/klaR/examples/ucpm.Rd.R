library(klaR)


### Name: ucpm
### Title: Uschi's classification performance measures
### Aliases: ucpm
### Keywords: classif

### ** Examples

library(MASS)
data(iris)
ucpm(predict(lda(Species ~ ., data = iris))$posterior, iris$Species)



