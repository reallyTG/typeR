library(mcca)


### Name: pdi
### Title: Calculate PDI Value
### Aliases: pdi
### Keywords: PDI

### ** Examples

rm(list=ls())
str(iris)
data <- iris[, 3]
label <- iris[, 5]
pdi(y = label, d = data,method = "multinom", k = 3)
## [1] 0.9845333
pdi(y = label, d = data,method = "tree", k = 3)
## [1] 0.9082667
pdi(y = label, d = data,method = "tree", k = 3,control = rpart::rpart.control(minsplit = 200))
## [1] 0

data <- data.matrix(iris[, 3])
label <- as.numeric(iris[, 5])
# multinomial
require(nnet)
# model
fit <- multinom(label ~ data, maxit = 1000, MaxNWts = 2000)
predict.probs <- predict(fit, type = "probs")
pp<- data.frame(predict.probs)
# extract the probablity assessment vector
head(pp)
pdi(y = label, d = pp, method = "prob", k = 3)
## [1] 0.9845333



