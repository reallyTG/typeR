library(mcca)


### Name: estp
### Title: Inference for Accuracy Improvement Measures based on Bootstrap
### Aliases: estp
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
estp(y = label, m1 = data[, 1], m2 = data[, 2], acc="idi",method="lda", k=4,B=10)

## $value
## [1] 0.1235644

## $se
## [1] 0.07053541

## $interval
## [1] 0.05298885 0.21915088

estp(y = label, m1 = data[, 1], m2 = data[, 2], acc="nri",method="tree", k=4,B=5)

## $value
## [1] 0.05

## $se
## [1] 0.09249111

## $interval
## [1] 0.0000000  0.1458333




