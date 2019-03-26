library(mcca)


### Name: nri
### Title: Calculate NRI Value
### Aliases: nri
### Keywords: NRI

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

nri(y = label, m1 = data[, 1], m2 = data[, 2], "lda", 4)
## [1] 0.1
nri(y = label, m1 = data[, 1], m2 = data[, 2], "tree", 4)
## [1] 0.05
nri(y = label, m1 = data[, 1], m2 = data[, 2], "tree", 4,control=rpart::rpart.control(minsplit=4))
## [1] 0.1357143



