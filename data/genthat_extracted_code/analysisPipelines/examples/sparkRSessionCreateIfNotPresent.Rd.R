library(analysisPipelines)


### Name: sparkRSessionCreateIfNotPresent
### Title: Connect to a Spark session
### Aliases: sparkRSessionCreateIfNotPresent

### ** Examples

## Not run: 
##D sparkHome <- "/Users/naren/softwares/spark-2.3.1-bin-hadoop2.7/"
##D sparkMaster <- "local[1]"
##D sparkPackages <- c("org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.1")
##D sparkRSessionCreateIfNotPresent(master = sparkMaster,
##D  sparkPackages = sparkPackages)
## End(Not run)



