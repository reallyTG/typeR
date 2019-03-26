library(spark.sas7bdat)


### Name: spark_read_sas
### Title: Read in SAS datasets in .sas7bdat format into Spark by using the
###   spark-sas7bdat Spark package.
### Aliases: spark_read_sas

### ** Examples

## Not run: 
##D ## If you haven't got a Spark cluster, you can install Spark locally like this
##D library(sparklyr)
##D spark_install(version = "2.0.1")
##D 
##D ## Define the SAS .sas7bdat file, connect to the Spark cluster to read + process the data
##D myfile <- system.file("extdata", "iris.sas7bdat", package = "spark.sas7bdat")
##D myfile
##D 
##D library(spark.sas7bdat)
##D sc <- spark_connect(master = "local")
##D x <- spark_read_sas(sc, path = myfile, table = "sas_example")
##D x
##D 
##D library(dplyr)
##D x %>% group_by(Species) %>%
##D   summarise(count = n(), length = mean(Sepal_Length), width = mean(Sepal_Width))
## End(Not run)



