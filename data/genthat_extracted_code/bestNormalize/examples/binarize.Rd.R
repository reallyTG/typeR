library(bestNormalize)


### Name: binarize
### Title: Binarize
### Aliases: binarize predict.binarize print.binarize

### ** Examples

x <- rgamma(100, 1, 1)
binarize_obj <- binarize(x)
(p <- predict(binarize_obj))

predict(binarize_obj, newdata = p, inverse = TRUE)



