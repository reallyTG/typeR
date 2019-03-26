library(sparklyr)


### Name: ml_corr
### Title: Compute correlation matrix
### Aliases: ml_corr

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D features <- c("Petal_Width", "Petal_Length", "Sepal_Length", "Sepal_Width")
##D 
##D ml_corr(iris_tbl, columns = features , method = "pearson")
## End(Not run)



