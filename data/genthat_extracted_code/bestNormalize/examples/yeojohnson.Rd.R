library(bestNormalize)


### Name: yeojohnson
### Title: Yeo-Johnson Normalization
### Aliases: yeojohnson predict.yeojohnson print.yeojohnson

### ** Examples


x <- rgamma(100, 1, 1)

yeojohnson_obj <- yeojohnson(x)
yeojohnson_obj
p <- predict(yeojohnson_obj)
x2 <- predict(yeojohnson_obj, newdata = p, inverse = TRUE)

all.equal(x2, x)




