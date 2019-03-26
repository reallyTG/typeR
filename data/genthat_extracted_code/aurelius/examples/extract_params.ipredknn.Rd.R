library(aurelius)


### Name: extract_params.ipredknn
### Title: extract_params.ipredknn
### Aliases: extract_params.ipredknn

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- ipred::ipredknn(Species ~ ., iris2)
params <- extract_params(model)



