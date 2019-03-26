library(bestNormalize)


### Name: log_x
### Title: Log(x + a) Transformation
### Aliases: log_x predict.log_x print.log_x

### ** Examples

x <- rgamma(100, 1, 1)

log_x_obj <- log_x(x)
log_x_obj
p <- predict(log_x_obj)
x2 <- predict(log_x_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)




