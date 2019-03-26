library(mcca)


### Name: rsq
### Title: Calculate RSQ Value
### Aliases: rsq
### Keywords: RSQ

### ** Examples

rm(list=ls())
str(iris)
data <- iris[, 1:4]
label <- iris[, 5]
rsq(y = label, d = data, method="multinom", k = 3)
## [1] 0.9638708
rsq(y = label, d = data, method = "tree", k = 3)
## [1] 0.889694

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
rsq(y = label, d = pp, method = "prob", k = 3)
## [1] 0.9638708

rm(list=ls())
table(mtcars$carb)
for (i in (1:length(mtcars$carb))) {
  if (mtcars$carb[i] == 3 | mtcars$carb[i] == 6 | mtcars$carb[i] == 8) {
    mtcars$carb[i] <- 9
  }
}
data <- data.matrix(mtcars[, c(1)])
mtcars$carb <- factor(mtcars$carb, labels = c(1, 2, 3, 4))
label <- as.numeric(mtcars$carb)
str(mtcars)
rsq(y = label, d = data, method="tree", k = 4)
## [1] 0.1899336
rsq(y = label, d = data, method="lda", k = 4)
## [1] 0.1456539
rsq(y = label, d = data, method="lda", k = 4,prior = c(100,1,1,1)/103)
## [1] 0.0431966




