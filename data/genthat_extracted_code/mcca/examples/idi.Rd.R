library(mcca)


### Name: idi
### Title: Calculate IDI Value
### Aliases: idi
### Keywords: IDI

### ** Examples

rm(list=ls())
table(mtcars$carb)
for (i in (1:length(mtcars$carb))) {
  if (mtcars$carb[i] == 3 | mtcars$carb[i] == 6 | mtcars$carb[i] == 8) {
    mtcars$carb[i] <- 9
  }
}
data <- data.matrix(mtcars[, c(1, 5)])
mtcars$carb <- factor(mtcars$carb, labels = c(1, 2, 3, 4))
label <- as.numeric(mtcars$carb)
str(mtcars)
idi(y = label, m1 = data[, 1], m2 = data[, 2], "tree", 4)
## [1] 0.09979413
idi(y = label, m1 = data[, 1], m2 = data[, 2], "tree", 4,control=rpart::rpart.control(minsplit=4))
## [1] 0.2216707




