library(sparklyr)


### Name: ml_chisquare_test
### Title: Chi-square hypothesis testing for categorical data.
### Aliases: ml_chisquare_test

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D features <- c("Petal_Width", "Petal_Length", "Sepal_Length", "Sepal_Width")
##D 
##D ml_chisquare_test(iris_tbl, features = features, label = "Species")
## End(Not run)



