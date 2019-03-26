library(sparkavro)


### Name: spark_read_avro
### Title: Reads a Avro File into Apache Spark
### Aliases: spark_read_avro

### ** Examples

## Not run: 
##D ## If you haven't got a Spark cluster, you can install Spark locally like this
##D library(sparklyr)
##D spark_install(version = "2.0.1")
##D 
##D sc <- spark_connect(master = "local")
##D df <- spark_read_avro(
##D   sc,
##D   "twitter",
##D   system.file("extdata/twitter.avro", package = "sparkavro"),
##D   repartition = FALSE,
##D   memory = FALSE,
##D   overwrite = FALSE
##D )
##D 
##D spark_disconnect(sc)
## End(Not run)



