library(sparklyr)


### Name: sdf_copy_to
### Title: Copy an Object into Spark
### Aliases: sdf_copy_to sdf_import

### ** Examples


sc <- spark_connect(master = "spark://HOST:PORT")
sdf_copy_to(sc, iris)




