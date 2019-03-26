library(h2o)


### Name: h2o.impute
### Title: Basic Imputation of H2O Vectors
### Aliases: h2o.impute

### ** Examples

## No test: 
 h2o.init()
 iris_hf <- as.h2o(iris)
 iris_hf[sample(nrow(iris_hf), 40), 5] <- NA  # randomly replace 50 values with NA
 # impute with a group by
 iris_hf <- h2o.impute(iris_hf, "Species", "mode", by = c("Sepal.Length", "Sepal.Width"))
## End(No test)



