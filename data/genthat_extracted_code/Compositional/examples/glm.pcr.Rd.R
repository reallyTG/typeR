library(Compositional)


### Name: Principal component generalised linear models
### Title: Principal component generalised linear models
### Aliases: glm.pcr
### Keywords: principal components regression generalised linear models

### ** Examples

library(MASS)
x <- as.matrix(iris[, 1:4])
y<- rbinom(150, 1, 0.6)
mod<- glm.pcr(y, x, k = 1)



