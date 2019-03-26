library(bestNormalize)


### Name: boxcox
### Title: Box-Cox Normalization
### Aliases: boxcox predict.boxcox print.boxcox

### ** Examples

x <- rgamma(100, 1, 1)

bc_obj <- boxcox(x)
bc_obj
p <- predict(bc_obj)
x2 <- predict(bc_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)



