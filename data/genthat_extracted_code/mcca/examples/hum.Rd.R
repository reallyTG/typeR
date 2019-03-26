library(mcca)


### Name: hum
### Title: Calculate HUM Value
### Aliases: hum
### Keywords: HUM

### ** Examples

rm(list=ls())
str(iris)
data <- iris[, 1:4]
label <- iris[, 5]
hum(y = label, d = data,method = "multinom", k = 3)
## [1] 0.9972
hum(y = label, d = data,method = "svm", k = 3)
## [1] 0.9964
hum(y = label, d = data,method = "svm", k = 3,type="C",kernel="linear",cost=4,scale=TRUE)
## [1] 0.9972
hum(y = label, d = data, method = "tree", k = 3)
## [1] 0.998

data <- data.matrix(iris[, 1:4])
label <- as.numeric(iris[, 5])
# multinomial
require(nnet)
# model
fit <- multinom(label ~ data, maxit = 1000, MaxNWts = 2000)
predict.probs <- predict(fit, type = "probs")
pp<- data.frame(predict.probs)
# extract the probablity assessment vector
head(pp)
hum(y = label, d = pp, method = "prob", k = 3)
## [1] 0.9972

rm(list=ls())
table(mtcars$carb)
for (i in (1:length(mtcars$carb))) {
  if (mtcars$carb[i] == 3 | mtcars$carb[i] == 6 | mtcars$carb[i] == 8) {
    mtcars$carb[i] <- 9
  }
}
data <- data.matrix(mtcars[, c(1:10)])
mtcars$carb <- factor(mtcars$carb, labels = c(1, 2, 3, 4))
label <- as.numeric(mtcars$carb)
str(mtcars)
hum(y = label, d = data, method = "tree", k = 4,control = rpart::rpart.control(minsplit = 5))
## [1] 1
hum(y = label, d = data, method = "svm", k = 4,kernel="linear",cost=0.7,scale=TRUE)
## [1] 1
hum(y = label, d = data, method = "svm", k = 4, kernel ="radial",cost=0.7,scale=TRUE)
## [1] 0.6217143



