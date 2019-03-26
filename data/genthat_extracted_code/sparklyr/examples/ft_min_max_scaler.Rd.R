library(sparklyr)


### Name: ft_min_max_scaler
### Title: Feature Transformation - MinMaxScaler (Estimator)
### Aliases: ft_min_max_scaler

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D features <- c("Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width")
##D 
##D iris_tbl %>%
##D   ft_vector_assembler(input_col = features,
##D                       output_col = "features_temp") %>%
##D   ft_min_max_scaler(input_col = "features_temp",
##D                      output_col = "features")
## End(Not run)




