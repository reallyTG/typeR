library(Directional)


### Name: Circular-linear correlation
### Title: Circular-linear correlation
### Aliases: circlin.cor
### Keywords: Circular-linear correlation

### ** Examples

phi <- rvonmises(50, 2, 20, rads = TRUE)
x <- 2 * phi + rnorm(50)
y <- matrix(rnorm(50 * 5), ncol = 5)
circlin.cor(phi, x, rads = TRUE)
circlin.cor(phi, y, rads = TRUE)



