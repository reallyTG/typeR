library(sparklyr)


### Name: ft_pca
### Title: Feature Transformation - PCA (Estimator)
### Aliases: ft_pca ml_pca

### ** Examples

## Not run: 
##D library(dplyr)
##D 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D iris_tbl %>%
##D   select(-Species) %>%
##D   ml_pca(k = 2)
## End(Not run)




