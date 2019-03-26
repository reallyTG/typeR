library(sparklyr)


### Name: sdf_pivot
### Title: Pivot a Spark DataFrame
### Aliases: sdf_pivot

### ** Examples

## Not run: 
##D library(sparklyr)
##D library(dplyr)
##D 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D # aggregating by mean
##D iris_tbl %>%
##D   mutate(Petal_Width = ifelse(Petal_Width > 1.5, "High", "Low" )) %>%
##D   sdf_pivot(Petal_Width ~ Species,
##D             fun.aggregate = list(Petal_Length = "mean"))
##D 
##D # aggregating all observations in a list
##D iris_tbl %>%
##D   mutate(Petal_Width = ifelse(Petal_Width > 1.5, "High", "Low" )) %>%
##D   sdf_pivot(Petal_Width ~ Species,
##D             fun.aggregate = list(Petal_Length = "collect_list"))
## End(Not run)




