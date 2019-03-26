library(aurelius)


### Name: extract_params.knn3
### Title: extract_params.knn3
### Aliases: extract_params.knn3

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- caret::knn3(Species ~ ., iris2)
extracted_params <- extract_params(model)



