library(bestNormalize)


### Name: arcsinh_x
### Title: arcsinh(x) Transformation
### Aliases: arcsinh_x predict.arcsinh_x print.arcsinh_x

### ** Examples

x <- rgamma(100, 1, 1)

arcsinh_x_obj <- arcsinh_x(x)
arcsinh_x_obj
p <- predict(arcsinh_x_obj)
x2 <- predict(arcsinh_x_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)




