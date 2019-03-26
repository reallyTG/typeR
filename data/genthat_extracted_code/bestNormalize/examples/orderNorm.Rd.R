library(bestNormalize)


### Name: orderNorm
### Title: Calculate and perform Ordered Quantile normalizing
###   transformation
### Aliases: orderNorm predict.orderNorm print.orderNorm

### ** Examples


x <- rgamma(100, 1, 1)

orderNorm_obj <- orderNorm(x)
orderNorm_obj
p <- predict(orderNorm_obj)
x2 <- predict(orderNorm_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)



