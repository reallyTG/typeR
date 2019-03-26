library(aurelius)


### Name: pfa.knn3
### Title: PFA Formatting of Fitted knns
### Aliases: pfa.knn3

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- caret::knn3(Species ~ ., iris2)
model_as_pfa <- pfa(model)



