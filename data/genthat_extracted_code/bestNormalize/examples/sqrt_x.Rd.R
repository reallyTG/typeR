library(bestNormalize)


### Name: sqrt_x
### Title: sqrt(x + a) Normalization
### Aliases: sqrt_x predict.sqrt_x print.sqrt_x

### ** Examples

x <- rgamma(100, 1, 1)

sqrt_x_obj <- sqrt_x(x)
sqrt_x_obj
p <- predict(sqrt_x_obj)
x2 <- predict(sqrt_x_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)




