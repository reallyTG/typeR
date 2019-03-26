library(arulesCBA)


### Name: wCBA
### Title: Classification Based on Association Rules
### Aliases: wCBA wcba

### ** Examples

data("iris")

classifier <- wCBA(Species ~ ., data = iris, supp = 0.05, conf = 0.9)

predict(classifier, head(iris))



