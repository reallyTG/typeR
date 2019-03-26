library(sparklyr)


### Name: stream_write_kafka
### Title: Write Kafka Stream
### Aliases: stream_write_kafka

### ** Examples

## Not run: 
##D 
##D config <- spark_config()
##D 
##D # The following package is dependent to Spark version, for Spark 2.3.2:
##D config$sparklyr.shell.packages <- "org.apache.spark:spark-sql-kafka-0-10_2.11:2.3.2"
##D 
##D sc <- spark_connect(master = "local", config = config)
##D 
##D read_options <- list(kafka.bootstrap.servers = "localhost:9092", subscribe = "topic1")
##D write_options <- list(kafka.bootstrap.servers = "localhost:9092", topic = "topic2")
##D 
##D stream <- stream_read_kafka(sc, options = read_options) %>%
##D   stream_write_kafka(options = write_options)
##D 
##D stream_stop(stream)
##D 
## End(Not run)




