library(ebmc)


### Name: predict.modelBag
### Title: Predict Method for modelBag Object
### Aliases: predict.modelBag

### ** Examples

data("iris")
iris <- iris[1:70, ]
iris$Species <- factor(iris$Species, levels = c("setosa", "versicolor"), labels = c("0", "1"))
samp <- sample(nrow(iris), nrow(iris) * 0.7)
train <- iris[samp, ]
test <- iris[-samp, ]
model <- ub(Species ~ ., data = train, size = 10, alg = "c50") # Build UnderBagging model
prob <- predict(model, newdata = test, type = "prob") # return probability estimation
pred <- predict(model, newdata = test, type = "class") # return predicted class



