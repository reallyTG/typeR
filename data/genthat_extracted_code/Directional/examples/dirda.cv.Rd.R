library(Directional)


### Name: Cross validation for estimating the classification rate
### Title: Cross validation for estimating the classification rate
### Aliases: dirda.cv
### Keywords: Discriminant analysis Von Mises-Fisher distributions

### ** Examples

x <- rvmf(300, rnorm(3), 10)
ina <- sample.int(4, 300, replace = TRUE)
dirda.cv(x, ina, B = 1000)



