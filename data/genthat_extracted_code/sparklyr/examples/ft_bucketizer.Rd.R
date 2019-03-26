library(sparklyr)


### Name: ft_bucketizer
### Title: Feature Transformation - Bucketizer (Transformer)
### Aliases: ft_bucketizer

### ** Examples

## Not run: 
##D library(dplyr)
##D 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D iris_tbl %>%
##D   ft_bucketizer(input_col  = "Sepal_Length",
##D                 output_col = "Sepal_Length_bucket",
##D                 splits     = c(0, 4.5, 5, 8)) %>%
##D   select(Sepal_Length, Sepal_Length_bucket, Species)
## End(Not run)




