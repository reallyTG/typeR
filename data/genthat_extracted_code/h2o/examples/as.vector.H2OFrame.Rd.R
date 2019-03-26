library(h2o)


### Name: as.vector.H2OFrame
### Title: Convert an H2OFrame to a vector
### Aliases: as.vector.H2OFrame

### ** Examples

## No test: 
h2o.init()
iris_hf <- as.h2o(iris)
cor_R <- cor(as.matrix(iris[, 1]))
cor_h2o <- cor(iris_hf[, 1])
iris_R_cor <- cor(iris[, 1:4])
iris_H2O_cor <- as.data.frame(cor(iris_hf[, 1:4]))
h2o_vec <- as.vector(unlist(iris_H2O_cor))
r_vec <- as.vector(unlist(iris_R_cor))
## End(No test)



