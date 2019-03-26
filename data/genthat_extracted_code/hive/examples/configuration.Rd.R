library(hive)


### Name: configuration
### Title: Managing the Hadoop configuration
### Aliases: hive_get_parameter hive_get_slaves hive_get_masters
###   hive_get_nreducer hive_set_nreducer

### ** Examples


## Which tmp directory is set in the Hadoop configuration?
## Not run: hive_get_parameter("hadoop.tmp.dir")

## The master nodes of the cluster
## Not run: hive_get_masters()

## The worker nodes of the cluster
## Not run: hive_get_slaves()

## The number of configured reducers
## Not run: hive_get_nreducer()




