library(sparklyr)


### Name: spark_apply
### Title: Apply an R Function in Spark
### Aliases: spark_apply

### ** Examples

## Not run: 
##D 
##D library(sparklyr)
##D sc <- spark_connect(master = "local")
##D 
##D # creates an Spark data frame with 10 elements then multiply times 10 in R
##D sdf_len(sc, 10) %>% spark_apply(function(df) df * 10)
##D 
## End(Not run)




