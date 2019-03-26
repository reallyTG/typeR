library(h2o)


### Name: apply
### Title: Apply on H2O Datasets
### Aliases: apply

### ** Examples

## No test: 
h2o.init()
iris_hf <- as.h2o(iris)
summary(apply(iris_hf, 2, sum))
## End(No test)



