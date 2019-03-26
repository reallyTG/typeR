library(datadr)


### Name: rhipeControl
### Title: Specify Control Parameters for RHIPE Job
### Aliases: rhipeControl

### ** Examples

## Not run: 
##D # input data on HDFS
##D d <- ddf(hdfsConn("/path/to/big/data/on/hdfs"))
##D 
##D # set RHIPE / Hadoop parameters
##D # buffer sizes control how many k/v pairs are sent to map / reduce tasks at a time
##D # mapred.reduce.tasks is a Hadoop config parameter that controls # of reduce tasks
##D rhctl <- rhipeControl(mapred = list(
##D   rhipe_map_buff_size = 10000,
##D   mapred.reduce.tasks = 72,
##D   rhipe_reduce_buff_size = 1)
##D 
##D # divide input data using these control parameters
##D divide(d, by = "var", output = hdfsConn("/path/to/output"), control = rhctl)
## End(Not run)



