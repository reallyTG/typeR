library(sparklyr)


### Name: ml_als
### Title: Spark ML - ALS
### Aliases: ml_als ml_recommend

### ** Examples

## Not run: 
##D 
##D library(sparklyr)
##D sc <- spark_connect(master = "local")
##D 
##D movies <- data.frame(
##D   user   = c(1, 2, 0, 1, 2, 0),
##D   item   = c(1, 1, 1, 2, 2, 0),
##D   rating = c(3, 1, 2, 4, 5, 4)
##D )
##D movies_tbl <- sdf_copy_to(sc, movies)
##D 
##D model <- ml_als(movies_tbl, rating ~ user + item)
##D 
##D ml_predict(model, movies_tbl)
##D 
##D ml_recommend(model, type = "item", 1)
## End(Not run)




