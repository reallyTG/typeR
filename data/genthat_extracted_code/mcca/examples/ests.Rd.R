library(mcca)


### Name: ests
### Title: Inference for Accuracy Measures based on Bootstrap
### Aliases: ests
### Keywords: CCR

### ** Examples

rm(list=ls())
str(iris)
data <- iris[, 1:4]
label <- iris[, 5]
ests(y = label, d = data,acc="hum",level=0.95,method = "multinom", k = 3,B=10,trace=FALSE)

## $value
## [1] 0.9972

## $se
## [1] 0.002051529

## $interval
## [1] 0.9935662 1.0000000

ests(y = label, d = data,acc="pdi",level=0.85,method = "tree", k = 3,B=10)

## $value
## [1] 0.9213333

## $se
## [1] 0.02148812

## $interval
## [1] 0.9019608 0.9629630

rm(list=ls())
table(mtcars$carb)
for (i in (1:length(mtcars$carb))) {
  if (mtcars$carb[i] == 3 | mtcars$carb[i] == 6 | mtcars$carb[i] == 8) {
    mtcars$carb[i] <- 9
  }
}
data <- data.matrix(mtcars[, c(1:2)])
mtcars$carb <- factor(mtcars$carb, labels = c(1, 2, 3, 4))
label <- as.numeric(mtcars$carb)
str(mtcars)
ests(y = label, d = data,acc="hum",level=0.95,method = "multinom", k = 4,trace=FALSE,B=5)

## $value
## [1] 0.2822857

## $se
## [1] 0.170327

## $interval
## [1] 0.2662500 0.4494643




