library(bestNormalize)


### Name: no_transform
### Title: Identity transformation
### Aliases: no_transform predict.no_transform print.no_transform

### ** Examples

x <- rgamma(100, 1, 1)

no_transform_obj <- no_transform(x)
no_transform_obj
p <- predict(no_transform_obj)
x2 <- predict(no_transform_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)




