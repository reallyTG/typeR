library(bestNormalize)


### Name: exp_x
### Title: exp(x) Transformation
### Aliases: exp_x predict.exp_x print.exp_x

### ** Examples

x <- rgamma(100, 1, 1)

exp_x_obj <- exp_x(x)
exp_x_obj
p <- predict(exp_x_obj)
x2 <- predict(exp_x_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)




