library(sparklyr)


### Name: ft_binarizer
### Title: Feature Transformation - Binarizer (Transformer)
### Aliases: ft_binarizer

### ** Examples

## Not run: 
##D library(dplyr)
##D 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D iris_tbl %>%
##D   ft_binarizer(input_col  = "Sepal_Length",
##D                output_col = "Sepal_Length_bin",
##D                threshold  = 5) %>%
##D   select(Sepal_Length, Sepal_Length_bin, Species)
## End(Not run)




