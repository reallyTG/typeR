library(sparklyr)


### Name: sdf_partition
### Title: Partition a Spark Dataframe
### Aliases: sdf_partition

### ** Examples

## Not run: 
##D # randomly partition data into a 'training' and 'test'
##D # dataset, with 60% of the observations assigned to the
##D # 'training' dataset, and 40% assigned to the 'test' dataset
##D data(diamonds, package = "ggplot2")
##D diamonds_tbl <- copy_to(sc, diamonds, "diamonds")
##D partitions <- diamonds_tbl %>%
##D   sdf_partition(training = 0.6, test = 0.4)
##D print(partitions)
##D 
##D # alternate way of specifying weights
##D weights <- c(training = 0.6, test = 0.4)
##D diamonds_tbl %>% sdf_partition(weights = weights)
## End(Not run)



