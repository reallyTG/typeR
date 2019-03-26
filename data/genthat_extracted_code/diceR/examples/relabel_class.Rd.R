library(diceR)


### Name: relabel_class
### Title: Relabel classes to a standard
### Aliases: relabel_class

### ** Examples

set.seed(2)
pred <- sample(1:4, 100, replace = TRUE)
true <- sample(1:4, 100, replace = TRUE)
relabel_class(pred, true)



