library(arulesCBA)


### Name: bCBA
### Title: Classification Based on Association Rules
### Aliases: bCBA bcba

### ** Examples

data("iris")

classifier <- bCBA(Species ~ ., data = iris, supp = 0.05, conf = 0.9,
		   lhs.support = TRUE)

predict(classifier, head(iris))



